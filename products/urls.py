from django.urls import path

from .views      import ProductListView, CategoriesView, ProductDetailView, ReviewView

urlpatterns=[
    path('', ProductListView.as_view()),
    path('/categories', CategoriesView.as_view()),
    path('/<int:product_id>', ProductDetailView.as_view()),
    path('/<int:product_id>/review', ReviewView.as_view()),
]
