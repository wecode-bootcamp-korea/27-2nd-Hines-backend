from django.urls import path, include

from .views      import ProductListView, ProductDetailView

urlpatterns=[
    path('', include([
        path('', ProductListView.as_view()),
    ])),
    path('/<int:product_id>', ProductDetailView.as_view()),
]