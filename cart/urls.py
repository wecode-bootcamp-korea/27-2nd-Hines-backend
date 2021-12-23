from django.urls import path

from .views      import CartView

urlpatterns=[
    path('/<int:product_id>', CartView.as_view()),
    path('', CartView.as_view())
]