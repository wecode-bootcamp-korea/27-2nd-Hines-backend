from django.urls import path, include

from .views      import ProductListView

urlpatterns=[
    path('', include([
        path('', ProductListView.as_view()),
    ])),
]