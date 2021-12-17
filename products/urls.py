from django.urls import path, include

from .views      import ProductListView, ProductDetailView, CategoriesView, ReviewView

urlpatterns=[
    path('', include([
        path('', ProductListView.as_view()),
    ])),
    path('/categories', CategoriesView.as_view()),
    path('/<int:product_id>', ProductDetailView.as_view()),
    path('/<int:product_id>/review', ReviewView.as_view()),
]