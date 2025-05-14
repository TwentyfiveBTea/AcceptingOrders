from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from house_crawler.models import HouseLianjia
@api_view(['GET'])
def api_home(request):
    houses = HouseLianjia.objects.all().values()  # 转换为字典
    return JsonResponse(list(houses), safe=False)  # safe=False 允许非字典数据
    #return Response({"message": "Hello from Django API!"})