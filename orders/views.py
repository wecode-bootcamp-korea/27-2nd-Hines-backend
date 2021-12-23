import json
import uuid

from enum import Enum

from django.http  import JsonResponse
from django.views import View
from django.db    import transaction

from orders.models  import Order, OrderStatus, OrderItem
from cart.models    import Cart
from users.models   import User
from core.decorator import login_required

class OrderStatus(Enum):
    WAIT_DEPOSIT     = 1
    COMPLETE_PAYMENT = 2
    SHIPPING         = 3
    DELIVERED        = 4
    CANCELLATION     = 5

class OrderView(View):
    @login_required
    def post(self, request):
        try:
            data     = json.loads(request.body)
            cart_ids = data['cart_ids']
            carts    = Cart.objects.filter(id__in=cart_ids, user=request.user)

            if not carts.exists():
                return JsonResponse({'message':'INVALID_CART'}, status=404)
            
            with transaction.atomic():
                order = Order.objects.create(
                    user            = User.objects.get(id=request.user.id),
                    order_status_id = OrderStatus.WAIT_DEPOSIT.value, 
                    order_number    = uuid.uuid4(),
                    tracking_number = uuid.uuid4(),
                    )
                bulk_list = [OrderItem(
                    product         = cart.product,
                    quantity        = cart.quantity,
                    order           = order
                    ) for cart in carts]
                carts.delete()
                OrderItem.objects.bulk_create(bulk_list)
            
            return JsonResponse({'message':'Created'}, status=201)
                
        except KeyError:
            return JsonResponse({'message':'KEY_ERROR'}, status=404)
    
    @login_required
    def get(self, request):
        orders = Order.objects.filter(user=request.user).select_related('order_status')\
                                                   .prefetch_related('orderitem_set__product').order_by('-created_at')
           
        results=[{
            'order_id'     : order.id,
            'order_number' : order.order_number,
            'order_status' : order.order_status.status,
            'products'     : [{
                'product_id'    : order_item.product.id,
                'product_name'  : order_item.product.name,
                'product_image' : order_item.product.thumbnail_image_url,
                'product_price' : order_item.product.price,
                'quantity'      : order_item.quantity,
            } for order_item in order.orderitem_set.all()]
        } for order in orders]

        return JsonResponse({'result':results},status=200)

    @login_required
    def patch(self, request):
        try:
            data = json.loads(request.body)

            with transaction.atomic():
                order = Order.objects.get(id=data['order_id'])
                order.order_status_id = OrderStatus.CANCELLATION.value
                order.save()

                return JsonResponse({'message':'SUCCESS'},status=200)

        except Order.DoesNotExist:
            return JsonResponse({'message':'INVALID_ORDER'},status=404)

        except KeyError:
            return JsonResponse({"message":"KEY_ERROR"},status=404)