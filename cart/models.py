from django.db       import models
from core.models     import TimeStampModel
from users.models    import User
from products.models import Product

class Cart(TimeStampModel):
    quantity = models.IntegerField(default=0)
    user     = models.ForeignKey(User, on_delete=models.CASCADE)
    product  = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields = ('user', 'product'),
                name   = 'unique_cart'
            )
        ]
        db_table = 'carts'