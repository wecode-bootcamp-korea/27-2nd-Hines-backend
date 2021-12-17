from django.urls import path, include

from .views      import ProductListView, ProductDetailView
from .views      import ProductListView, CategoriesView

urlpatterns=[
    path('', include([
        path('', ProductListView.as_view()),
    ])),
    path('/<int:product_id>', ProductDetailView.as_view()),
    path('/categories', CategoriesView.as_view()),
]