from django.db    import models
from users.models import User
from core.models  import TimeStampModel

class Menu(models.Model):
    name = models.CharField(max_length=45)

    class Meta:
        db_table = 'menus'

class Category(models.Model):
    name = models.CharField(max_length=45)
    menu = models.ForeignKey('Menu', on_delete=models.CASCADE)

    class Meta:
        db_table = 'categories'

class SubCategory(models.Model):
    name     = models.CharField(max_length=45)
    category = models.ForeignKey('Category', on_delete=models.CASCADE)

    class Meta:
        db_table = 'sub_categories'

class Product(TimeStampModel):
    name                = models.CharField(max_length=45)
    price               = models.DecimalField(max_digits=10, decimal_places=2)
    brand               = models.CharField(max_length=45)
    thumbnail_image_url = models.URLField(max_length=1000)
    description         = models.TextField()
    sub_category        = models.ForeignKey('SubCategory', on_delete=models.CASCADE)

    class Meta:
        db_table = 'products'

class Image(TimeStampModel):
    image_url = models.URLField(max_length=1000)
    product   = models.ForeignKey('Product', on_delete=models.CASCADE)

    class Meta:
        db_table = 'images'

class Review(TimeStampModel):
    image_url = models.URLField(max_length=1000, null=True)
    content   = models.TextField()
    user      = models.ForeignKey(User, on_delete=models.CASCADE)
    product   = models.ForeignKey('Product', on_delete=models.CASCADE)

    class Meta:
        db_table = 'reviews'