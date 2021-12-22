import requests
import jwt

from django.http  import JsonResponse
from django.views import View

from users.models import User
from my_settings  import SECRET_KEY, ALGORITHM

class KakaoAPI:
    try:
        def __init__(self, access_token):
            self.access_token = access_token
            self.user_url     = 'https://kapi.kakao.com/v2/user/me'

        def get_kakao_user(self):
            headers = {'Authorization' : f'Bearer ${self.access_token}'}
            response = requests.get(self.user_url, headers=headers, timeout=0.1)
            
            if not response.status_code == 200:
                return JsonResponse({'message':'ResponseError'}, status=400)
            
            return response.json()
            
    except requests.exceptions.Timeout as errd:
        print("TimeoutError:", errd)
    
class KakaoLoginView(View):
    def post(self, request):
        
        try:
            kakao_access_token = request.headers['Authorization']
            kakao_api          = KakaoAPI(kakao_access_token)
            kakao_user         = kakao_api.get_kakao_user()

            kakao_id   = kakao_user['id']
            user_name  = kakao_user['kakao_account']['profile']['nickname']
            user_email = kakao_user['kakao_account']['email']

            user, created = User.objects.get_or_create(
                kakao_id  = kakao_id,
                name      = user_name,
                email     = user_email
            )

            hines_token = jwt.encode({'id' : user.id}, SECRET_KEY, ALGORITHM)
            
            if not created:
                return JsonResponse({'message':'CREATED', 'Authorization' : hines_token, 'username':user_name}, status=200)
            
            return JsonResponse({'message':'SUCCESS', 'Authorization' : hines_token, 'username':user_name}, status=201)

        except KeyError:
            return JsonResponse({'message':'KeyError'}, status=400)