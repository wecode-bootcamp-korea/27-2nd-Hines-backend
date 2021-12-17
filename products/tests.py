import json

from django.http import response
from django.test import TestCase, Client, client

from users.models     import User
from products.models  import Menu, SubCategory, Category, Product, Image, Review

class ProductsAppTest(TestCase):
    def setUp(self):
        Menu.objects.create(
            id   = 1,
            name = 'P'
        )

        Category.objects.create(
            id      = 1,
            name    = 'PA',
            menu_id = 1
        )

        Category.objects.create(
            id      = 2,
            name    = 'DO',
            menu_id = 1
        )

        SubCategory.objects.create(
            id          = 1,
            name        = 'PAK',
            category_id = 1
        )

        SubCategory.objects.create(
            id          = 2,
            name        = 'RAL',
            category_id = 1
        )

        SubCategory.objects.create(
            id          = 3,
            name        = 'MONS',
            category_id = 2
        )

        Product.objects.create(
            id                  = 1,
            name                = 'PAKA',
            price               = '9999.99',
            brand               = 'DW',
            description         = 'description',
            thumbnail_image_url = 'https://raw.githubusercontent.com/Djangowon/TIL/main/image/15C58535-76A3-4A64-813A-3896D4A6DEE7.jpeg',
            sub_category_id     = 1
        )

        Product.objects.create(
            id                  = 2,
            name                = 'RALO',
            price               = '9999.99',
            brand               = 'DW',
            description         = 'description',
            thumbnail_image_url = 'https://raw.githubusercontent.com/Djangowon/TIL/main/image/15C58535-76A3-4A64-813A-3896D4A6DEE7.jpeg',
            sub_category_id     = 2
        )

        Product.objects.create(
            id                  = 3,
            name                = 'DOPA',
            price               = '9999.99',
            brand               = 'DW',
            description         = 'description',
            thumbnail_image_url = 'https://raw.githubusercontent.com/Djangowon/TIL/main/image/15C58535-76A3-4A64-813A-3896D4A6DEE7.jpeg',
            sub_category_id     = 3
        )

    def tearDown(self):
        Product.objects.all().delete()
        Menu.objects.all().delete()
        Category.objects.all().delete()
        SubCategory.objects.all().delete()

    def test_success_product_list_view(self):
        client = Client()
        response = client.get('/products')

        self.assertEqual(response.status_code, 200)

        self.assertEqual(response.json(),
            {
                "result" : [{
                    'id':1,
                    'name':'PAKA',
                    'price':'9999.99',
                    'brand':'DW',
                    'description':'description',
                    'thumbnail_image_url':'https://raw.githubusercontent.com/Djangowon/TIL/main/image/15C58535-76A3-4A64-813A-3896D4A6DEE7.jpeg'
                },{
                    'id':2,
                    'name':'RALO',
                    'price':'9999.99',
                    'brand':'DW',
                    'description':'description',
                    'thumbnail_image_url':'https://raw.githubusercontent.com/Djangowon/TIL/main/image/15C58535-76A3-4A64-813A-3896D4A6DEE7.jpeg'
                },{
                    'id':3,
                    'name':'DOPA',
                    'price':'9999.99',
                    'brand':'DW',
                    'description':'description',
                    'thumbnail_image_url':'https://raw.githubusercontent.com/Djangowon/TIL/main/image/15C58535-76A3-4A64-813A-3896D4A6DEE7.jpeg'
                }]
            }
        )
    
    def test_success_product_list_view_by_sub_category_id(self):
        client = Client()
        response = client.get('/products?sub_category_id=2')

        self.assertEqual(response.status_code, 200)

        self.assertEqual(response.json(),
            {
                "result": [{
                    'id':2,
                    'name':'RALO',
                    'price':'9999.99',
                    'brand':'DW',
                    'description':'description',
                    'thumbnail_image_url':'https://raw.githubusercontent.com/Djangowon/TIL/main/image/15C58535-76A3-4A64-813A-3896D4A6DEE7.jpeg'
                }]
            }
        )

    def test_search_product_list_view(self):
        client = Client()
        response = client.get('/products?search=PAKA')

        self.assertEqual(response.status_code, 200)

        self.assertEqual(response.json(),
            {
                'result': [{
                    'id': 1, 
                    'name': 'PAKA', 
                    'price': '9999.99', 
                    'brand': 'DW', 
                    'description': 'description', 
                    'thumbnail_image_url': 'https://raw.githubusercontent.com/Djangowon/TIL/main/image/15C58535-76A3-4A64-813A-3896D4A6DEE7.jpeg'
                }]
            }
        )
    
    def test_success_categories_view(self):
        client = Client()
        response = client.get('/products/categories?category_id=2')

        self.assertEqual(response.status_code, 200)

        self.assertEqual(response.json(),
            {
                'message':'SUCCESS',
                'result': [{
                    'id': 2,
                    'name': 'DO'
                }]
            }
        )

    def test_error_categories_view(self):
        client = Client()
        response = client.get('/products/categories?category_id=kk')

        self.assertEqual(response.status_code, 400)

        self.assertEqual(response.json(),
            {
                'message':'INVALID_VALUE'
            }
        )

class ProductDetailViewest(TestCase):
    def setUp(self):
        self.client = Client()

        Menu.objects.create(
            id   = 1,
            name = '홈'
        )

        Category.objects.create(
            id      = 1,
            name    = '옷',
            menu_id = 1
        )

        SubCategory.objects.create(
            id          = 1,
            name        = '상의',
            category_id = 1
        )

        Product.objects.create(
            id                  = 1,
            name                = '상품1',
            price               = '1111111.00',
            brand               = 'zara',
            description         = '상품1설명입니다',
            thumbnail_image_url = 'http:상품1썸네일이미지',
            sub_category_id     = 1 
        )

        Product.objects.create(
            id                  = 2,
            name                = '상품2',
            price               = '222222.00',
            brand               = 'zara2',
            description         = '상품2설명입니다',
            thumbnail_image_url = 'http:상품2썸네일이미지',
            sub_category_id     = 1
        )  

        Product.objects.create(
            id                  = 3,
            name                = '상품3',
            price               = '333333.00',
            brand               = 'zara3',
            description         = '상품3설명입니다',
            thumbnail_image_url = 'http:상품3썸네일이미지',
            sub_category_id     = 1
        ) 

        Product.objects.create(
            id                  = 4,
            name                = '상품4',
            price               = '444444.00',
            brand               = 'zara4',
            description         = '상품4설명입니다',
            thumbnail_image_url = 'http:상품4썸네일이미지',
            sub_category_id     = 1
        )  

        Image.objects.create(
            id         = 1,
            image_url  = 'http:상품1이미지',
            product_id = 1
        )

        Image.objects.create(
            id         = 2,
            image_url  = 'http:상품5이미지',
            product_id = 1
        )
        
        Image.objects.create(
            id         = 3,
            image_url  = 'http:상품2이미지',
            product_id = 2
        )

        Image.objects.create(
            id         = 4,
            image_url  = 'http:상품3이미지',
            product_id = 3
        )

        Image.objects.create(
            id         = 5,
            image_url  = 'http:상품4이미지',
            product_id = 4
        )

    def tearDown(self):
        Menu.objects.all().delete()
        SubCategory.objects.all().delete()
        Category.objects.all().delete()
        Product.objects.all().delete()
        Image.objects.all().delete()

    def test_product_detail_view_get_success(self):
        client = Client()

        response = client.get('/products/1')

        self.assertEqual(response.json(),
            {
                'message' : {
                        'name' : '상품1',
                        'price' : '1111111.00',
                        'brand' : 'zara',
                        'description' : '상품1설명입니다',
                        'thumbnail_image_url' : 'http:상품1썸네일이미지',
                        'image_url' : ['http:상품1이미지', 'http:상품5이미지']
                }
            }
        )

        self.assertEqual(response.status_code, 200)

    def test_product_detail_view_get_doesnotexist(self):
        client = Client()

        response = client.get('/products/5')

        self.assertEqual(response.json(),
            {'message': 'PRODUCT_DOESNOT_EXIST'}
        )

        self.assertEqual(response.status_code, 400)

class ReviewViewTest(TestCase):
    def setUp(self):
        Menu.objects.create(
            id   = 1,
            name = '홈'
        )
 
        Category.objects.create(
            id      = 1,
            name    = '옷',
            menu_id = 1
        )
 
        SubCategory.objects.create(
            id          = 1,
            name        = '상의',
            category_id = 1
        )
 
        Product.objects.create(
            id                  = 1,
            name                = '상품1',
            price               = '1111111.00',
            brand               = 'zara',
            description         = '상품1설명입니다',
            thumbnail_image_url = 'http:상품1썸네일이미지',
            sub_category_id     = 1 
        )
 
        Product.objects.create(
            id                  = 2,
            name                = '상품2',
            price               = '222222.00',
            brand               = 'zara2',
            description         = '상품2설명입니다',
            thumbnail_image_url = 'http:상품2썸네일이미지',
            sub_category_id     = 1
        )  
 
        Product.objects.create(
            id                  = 3,
            name                = '상품3',
            price               = '333333.00',
            brand               = 'zara3',
            description         = '상품3설명입니다',
            thumbnail_image_url = 'http:상품3썸네일이미지',
            sub_category_id     = 1
        )  
 
        Image.objects.create(
            id         = 1,
            image_url  = 'http:상품1이미지',
            product_id = 1
        )
 
        Image.objects.create(
            id         = 2,
            image_url  = 'http:상품5이미지',
            product_id = 1
        )
 
        Image.objects.create(
            id         = 3,
            image_url  = 'http:상품2이미지',
            product_id = 2
        )
 
        Image.objects.create(
            id         = 4,
            image_url  = 'http:상품3이미지',
            product_id = 3
        )
 
        User.objects.create(
            id       = 1,
            name     = '전원우',
            kakao_id = '1',
            email    = 'wonwoo@gmial.com'
        )
    
    def tearDown(self):
        Menu.objects.all().delete()
        Category.objects.all().delete()
        SubCategory.objects.all().delete()        
        Product.objects.all().delete()
        User.objects.all().delete()
    
    def test_review_view_test_post_success(self):
        client = Client()
 
        result = {
            'kakao_id'   : 1, 
            'product_id' : 1,
            'content'    : 'test111',
            'image_url'  : 'test1'
        }
    
        response = client.post('/products/review', json.dumps(result), content_type='application/json')
       
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(),
            {
                'message':'SUCCESS'
            }   
        )
    
    def test_review_view_test_post_key_error(self):
        client = Client()
 
        result = {
            'id'         : 1, 
            'product_id' : 1,
            'content'    : 'test111',
            'image_url'  : 'test1'
        }
    
        response = client.post('/products/review', json.dumps(result), content_type='application/json')
    
        self. assertEqual(response.status_code, 400)
    
        self.assertEqual(response.json(),
            {
                'message':'KEY_ERROR'
            }
        )
    
    def test_review_view_test_post_unauthorized_user(self):
        client = Client()
 
        result = {
            'kakao_id'   : 2, 
            'product_id' : 1,
            'content'    : 'test111',
            'image_url'  : 'test1'
        }
    
        response = client.post('/products/review', json.dumps(result), content_type='application/json')
    
        self.assertEqual(response.status_code, 401)
    
        self.assertEqual(response.json(),
            {
                'message':'UNAUTHORIZED_USER'
            }   
        )
    
    def test_review_view_test_post_no_product(self):
        client = Client()
 
        result = {
            'kakao_id'   : 1, 
            'product_id' : 5,
            'content'    : 'test111',
            'image_url'  : 'test1'
        }
    
        response = client.post('/products/review', json.dumps(result), content_type='application/json')
    
        self.assertEqual(response.status_code, 400)
    
        self.assertEqual(response.json(),
            {
                'message':'NO_PRODUCT'
            } 
        )