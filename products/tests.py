from django.test import TestCase, Client

from .models import *

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