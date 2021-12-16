from django.urls import path

from users.views import KakaoLoginView

urlpatterns = [
    path('', KakaoLoginView.as_view()),
]
