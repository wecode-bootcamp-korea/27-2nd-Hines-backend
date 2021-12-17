from django.test import TestCase, Client

import json, jwt

from .models import Order, OrderItem, OrderStatus
from users.models import User
from products.models import Product, Menu, Category, SubCategory
from cart.models import Cart
from unittest import mock
from unittest.mock import patch
from my_settings    import SECRET_KEY, ALGORITHM

class OrderTest(TestCase):
    def setUp(self):
        
        User.objects.create(
            id =1,
            name = '이지현',
            kakao_id='kakao',
            email='email'
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
            id = 1,
            status = '배송중'
        )
        
        OrderStatus.objects.create(
            id = 5,
            status = '주문취소'
        )
        
        Cart.objects.create(
            id = 1,
            quantity = '10',
            user_id = 1,
            product_id = 1
        )
       
        Order.objects.create(
            id = 1,
            user_id = 1,
            order_status_id = 1,
            order_number = 'a',
            tracking_number = 'z',
        )
        
        OrderItem.objects.create(
            id = 1,
            quantity = '10',
            order_id = 1,
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

    def test_orderview_post_success(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}
        order = {
            'cart_id' : 1,
            'user_id' : 1
        }
        response = client.post('/orders', json.dumps(order),
                               content_type='application/json', **headers)
        
        self.assertEqual(response.json(),
                         {'message':'Created'})
        self.assertEqual(response.status_code, 201)

    def test_orderview_post_invalid_cart_error(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}
        order = {
            'cart_id' : 3,
            'user_id' : 1
        }
        response = client.post('/orders', json.dumps(order),
                               content_type='application/json', **headers)
        
        self.assertEqual(response.json(),
                         {'message':'INVALID_CART'})
        self.assertEqual(response.status_code, 404)
        
    def test_orderview_post_key_error(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}
        order = {
            'carts_id' : 3,
            'user_id' : 1
        }
        response = client.post('/orders', json.dumps(order),
                               content_type='application/json', **headers)
        
        self.assertEqual(response.json(),
                         {'message':'KEY_ERROR'})
        self.assertEqual(response.status_code, 404)

    def test_orderview_get_success(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}
        response = client.get('/orders', **headers)
        
        self.assertEqual(response.json(),
        { 'result' : [{
            'order_id'     : 1,
            'order_number' : 'a',
            'order_status' : '배송중',
            'products'     : [{
                'product_id'    : 1,
                'product_image' : 'https://raw.githubusercontent.com/Djangowon/TIL/main/image/15C58535-76A3-4A64-813A-3896D4A6DEE7.jpeg',
                'product_name'  : 'PAKA',
                'product_price' : '9999.99',
                'quantity'      : 10,
        }]}]})
        self.assertEqual(response.status_code, 200)

    def test_orderview_patch_success(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}
        order = {
            'order_id' : 1,
        }
        response = client.patch('/orders', json.dumps(order),
                               content_type='application/json', **headers)
        
        self.assertEqual(response.json(),
                         {'message':'SUCCESS'})
        self.assertEqual(response.status_code, 200)
        
    def test_orderview_patch_invalid_order_error(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}
        order = {
            'order_id' : 10,
        }
        response = client.patch('/orders', json.dumps(order),
                               content_type='application/json', **headers)
        
        self.assertEqual(response.json(),
                         {'message':'INVALID_ORDER'})
        self.assertEqual(response.status_code, 404)
        
    def test_orderview_patch_key_error(self):
        client = Client()
        headers = {'HTTP_Authorization':self.token}
        order = {
            'orer_id' : 1,
        }
        response = client.patch('/orders', json.dumps(order),
                               content_type='application/json', **headers)
        
        self.assertEqual(response.json(),
                         {'message':'KEY_ERROR'})
        self.assertEqual(response.status_code, 404)
