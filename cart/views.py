import json

from django.http      import JsonResponse
from django.views     import View
from core.decorator   import login_required
from .models          import Cart

class CartView(View):
    @login_required
    def post(self, request):

        data       = json.loads(request.body)
        product_id = data['product_id']
        quantity   = data['quantity']

        cart, created  = Cart.objects.get_or_create(
            user_id    = request.user.id,
            product_id = product_id
        )

        cart.quantity += quantity
        cart.save()

        return JsonResponse({'message':'SUCCESS'}, status=200)

    @login_required
    def get(self, request):

        carts = Cart.objects.select_related('product').filter(user=request.user)

        results = [{
            'cart_id'       : cart.id,
            'quantity'      : cart.quantity,
            'product_id'    : cart.product.id,
            'product_name'  : cart.product.name,
            'product_price' : cart.product.price,
            'product_brand' : cart.product.brand,
            'product_image' : cart.product.thumbnail_image_url } for cart in carts 
        ]

        return JsonResponse({'result':results}, status=200)

    @login_required
    def patch(self, request, product_id):
        try:
            data = json.loads(request.body)

            cart = Cart.objects.get(product_id=product_id, user=request.user)

            cart.quantity = data['quantity']
            cart.save()

            return JsonResponse({'message':'SUCCESS'}, status=200)

        except KeyError:
            return JsonResponse({'message':'KEY_ERROR'}, status=400)
        
        except Cart.DoesNotExist:
            return JsonResponse({'message':'CART DOES NOT EXIST'}, status=400)

    @login_required
    def delete(self, request):
        cart_id = request.GET.get('cartIds')
        Cart.objects.filter(id=cart_id, user=request.user).delete()

        return JsonResponse({'message':'NO_CONTENTS'}, status=204)
    