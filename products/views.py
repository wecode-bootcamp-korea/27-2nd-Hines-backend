import json

from django.views     import View
from django.http      import JsonResponse
from django.db.models import Q

from users.models     import User
from products.models  import Category, Product, Review, SubCategory
from core.decorator   import login_required

class ProductListView(View):
    def get(self, request):
        category_id     = request.GET.get('category_id')
        sub_category_id = request.GET.get('sub_category_id')
        search_keyword  = request.GET.get('search')
        order_method    = request.GET.get('sort_method', 'created_at')

        limit  = int(request.GET.get('limit', 100))
        offset = int(request.GET.get('offset', 0))

        q = Q()

        if sub_category_id:
            q &= Q(sub_category_id=sub_category_id)

        if search_keyword:
            q &= Q(name__icontains=search_keyword)|Q(brand__icontains=search_keyword)|Q(description__icontains=search_keyword)

        if category_id:
            q &= Q(sub_category_id__category_id=category_id)

        products = Product.objects.filter(q).order_by(order_method)[offset:offset+limit]
            
        results = [{
            'id'                  : product.id,
            'name'                : product.name,
            'price'               : product.price,
            'brand'               : product.brand,
            'description'         : product.description,
            'thumbnail_image_url' : product.thumbnail_image_url 
        } for product in products]

        return JsonResponse({'result':results}, status=200)

class ProductDetailView(View):
    def get(self, request, product_id):
        try: 
            product = Product.objects.get(id=product_id)
            images  = product.image_set.all() 
            
            image_list = []
            for image in images: 
                image_list.append(image.image_url)

            result = {
                        'name'                : product.name,
                        'price'               : product.price,
                        'brand'               : product.brand,
                        'description'         : product.description,
                        'thumbnail_image_url' : product.thumbnail_image_url,
                        'image_url'           : image_list
                    }
            return JsonResponse({'result' : result}, status=200)     

        except Product.DoesNotExist:
            return JsonResponse({'message' : 'PRODUCT_DOESNOT_EXIST'}, status=400) 

class CategoriesView(View):
    def get(self, request):
        categories = Category.objects.all().prefetch_related('subcategory_set')

        results = [{
            'id'   : category.id,
            'name' : category.name,
            'sub_category' : [{
                'id'   : sub_category.id,
                'name' : sub_category.name
            } for sub_category in category.subcategory_set.all()]
        } for category in categories]

        return JsonResponse({'message':'SUCCESS', 'result':results }, status=200)
            
class ReviewView(View):
    @login_required
    def post(self, request, product_id):
        try:
            data       = json.loads(request.body)
            product_id = product_id
            content    = data['content']
            image      = data.get('image_url', '')
                         
            if not User.objects.filter(id=request.user.id).exists():
                return JsonResponse({'message':'UNAUTHORIZED_USER'}, status=401)

            if not Product.objects.get(id=product_id):
                return JsonResponse({'message':'NO_PRODUCT'}, status=400)
            
            Review.objects.create(
                user_id    = request.user.id, 
                product_id = product_id,
                content    = content,
                image_url  = image
            )
            return JsonResponse({'message':'SUCCESS'}, status=200)

        except KeyError:
            return JsonResponse({'message':'KEY_ERROR'}, status=400)

        except Product.DoesNotExist:
            return JsonResponse({'message':'NO_PRODUCT'}, status=400)