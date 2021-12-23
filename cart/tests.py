import json, jwt
from django.http.response import JsonResponse

from django.test     import TestCase, Client
from orders.models   import Order, OrderItem, OrderStatus
from users.models    import User
from products.models import Product, Menu, Category, SubCategory
from cart.models     import Cart
from my_settings     import SECRET_KEY, ALGORITHM

class CartAppTest(TestCase):
    def setUp(self):
        User.objects.create(
            id       = 1,
            name     = '이지현',
            kakao_id = 'kakao',
            email    = 'email'
        )
        Menu.objects.create(
            id   = 1,
            name = 'P'
        )

        Category.objects.create(
            id      = 1,
            name    = 'PA',
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

        OrderStatus.objects.create(
            id     = 1,
            status = '배송중'
        )
        
        OrderStatus.objects.create(
            id     = 5,
            status = '주문취소'
        )
        
        Cart.objects.create(
            id         = 1,
            quantity   = '10',
            user_id    = 1,
            product_id = 1
        )
       
        Order.objects.create(
            id              = 1,
            user_id         = 1,
            order_status_id = 1,
            order_number    = 'a',
            tracking_number = 'z',
        )
        
        OrderItem.objects.create(
            id         = 1,
            quantity   = '10',
            order_id   = 1,
            product_id = 1
        )
        
        self.token = jwt.encode({'id':1}, SECRET_KEY, ALGORITHM)
        
    def tearDown(self):
        User.objects.all().delete()
        Product.objects.all().delete()
        Menu.objects.all().delete()
        Category.objects.all().delete()
        SubCategory.objects.all().delete()
        Order.objects.all().delete()
        OrderStatus.objects.all().delete()
        OrderItem.objects.all().delete()
        Cart.objects.all().delete()

    def test_success_post_cart_view(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}
        cart = {
            'product_id' : 1,
            'quantity' : 1
        }
        response = client.post('/cart', json.dumps(cart), content_type='application/json', **headers)

        self.assertEqual(response.status_code, 200)

        self.assertEqual(response.json(),
            {
                'message':'SUCCESS'
            }
        )

    def test_created_post_cart_view(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}
        cart = {
            'product_id' : 2,
            'quantity' : 1
        }
        response = client.post('/cart', json.dumps(cart), content_type='application/json', **headers)

        self.assertEqual(response.status_code, 200)

        self.assertEqual(response.json(),
            {
                'message':'SUCCESS'
            }
        )

    def test_success_get_cart_view(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}

        response = client.get('/cart', **headers)

        self.assertEqual(response.status_code, 200)

        self.assertEqual(response.json(),
            {'result': [{
                'cart_id'       : 1,
                'quantity'      : 10,
                'product_id'    : 1,
                'product_name'  : 'PAKA',
                'product_price' : '9999.99',
                'product_brand' : 'DW',
                'product_image' : 'https://raw.githubusercontent.com/Djangowon/TIL/main/image/15C58535-76A3-4A64-813A-3896D4A6DEE7.jpeg'}]}
        )

    def test_success_patch_cart_view(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}
        body = {
            'quantity' : 2
        }

        response = client.patch('/cart/1', json.dumps(body), content_type='application/json', **headers)

        self.assertEqual(response.status_code, 200)

        print(response.json())

    def test_success_delete_cart_view(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}

        response = client.delete('/cart?cartIds=1', **headers)

        self.assertEqual(response.status_code, 204)