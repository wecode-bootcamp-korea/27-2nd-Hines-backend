from django.db   import models
from core.models import TimeStampModel

class User(TimeStampModel):
    name     = models.CharField(max_length=45)
    kakao_id = models.CharField(max_length=45, unique=True)
    email    = models.EmailField(unique=True)

    class Meta:
        db_table = 'users'