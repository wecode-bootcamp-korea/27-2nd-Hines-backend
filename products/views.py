import json
from django.core import paginator

from django.views          import View
from django.http           import JsonResponse
from django.db.models      import Q
from django.core.paginator import Paginator

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

            
        limit  = int(request.GET.get('limit', 100))
        offset = int(request.GET.get('offset', 0))

        q = Q()

        if sub_category_id:
            q &= Q(sub_category_id=sub_category_id)

        if search_keyword:
            q &= Q(name__icontains=search_keyword)|Q(brand__icontains=search_keyword)|Q(description__icontains=search_keyword)

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

            result = {
                'category_name'       : product.sub_category.category.name,
                'sub_category_name'   : product.sub_category.name, 
                'product_name'        : product.name,
                'price'               : int(product.price),
                'brand'               : product.brand,
                'description'         : product.description,
                'thumbnail_image_url' : product.thumbnail_image_url,
                'image_url'           : [image.image_url for image in images]
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
            content    = data['content']
            image      = data.get('image_url', '')

            if not Product.objects.filter(id=product_id).exists():
                return JsonResponse({'message':'INAVID_PRODUCT_ID'}, status=400)

            Review.objects.create(
                user_id    = request.user.id, 
                product_id = product_id,
                content    = content,
                image_url  = image
            )
            
            return JsonResponse({'message':'SUCCESS'}, status=201)

        except KeyError:
            return JsonResponse({'message':'KEY_ERROR'}, status=400)
   
    def get(self, request, product_id):
        offset      = int(request.GET.get('offset', 0))
        limit       = int(request.GET.get('limit', 5))
        ordering    = request.GET.get('sort', 'created_at')
        reviews     = Review.objects.filter(product_id = product_id).order_by(ordering)[offset:limit+offset]
        review_count = Review.objects.filter(product_id = product_id).count()

        if limit > 5 :
            return JsonResponse({'message':'LMIMT_ERROR'}, status=400)

        result = {
            'total_count' : review_count,
            'results' : [{
                'id'           : review.id,
                'date'         : review.created_at.strftime('%Y.%m.%d.%a'),
                'kakao_id'     : review.user.kakao_id,
                'product_name' : review.product.name,
                'content'      : review.content,
                'image_url'    : [image.image_url for image in review.product.image_set.all()]
            } for review in reviews]}

        return JsonResponse({'result' : result}, status=200)
  