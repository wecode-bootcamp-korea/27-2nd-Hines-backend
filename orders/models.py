from django.db       import models
from core.models     import TimeStampModel
from users.models    import User
from products.models import Product

class Order(TimeStampModel):
    order_number    = models.CharField(max_length=45, unique=True)
    user            = models.ForeignKey(User, on_delete=models.CASCADE)
    order_status    = models.ForeignKey('OrderStatus', on_delete=models.CASCADE)
    tracking_number = models.CharField(max_length=45, unique=True)

    class Meta:
        db_table = 'orders'

class OrderStatus(models.Model):
    status = models.CharField(max_length=45)
    
    class Meta:
        db_table = 'order_status'

class OrderItem(TimeStampModel):
    quantity = models.IntegerField()
    order    = models.ForeignKey('Order', on_delete=models.CASCADE)
    product  = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        db_table = 'order_items'
