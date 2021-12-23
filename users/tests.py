from django.test import TestCase, Client

from unittest.mock import MagicMock, patch

class KakaoLogin(TestCase):
    @patch("users.views.requests")
    def test_kakao_login_new_user_success(self, mocked_requests):
        client = Client()
        
        class MockedResponse:
            status_code=200
            def json(self):
                return {
                    "id":"123456789", 
                    "kakao_account": {
                        "profile": {
                            "nickname":"홍길동"}, 
                        "email":"test@gmail.com"}}
                
        mocked_requests.get = MagicMock(return_value = MockedResponse())
        headers             = {"HTTP_Authorization": "fake access_token"}
        response            = client.post("/users", **headers)
        self.assertEqual(response.status_code, 201)