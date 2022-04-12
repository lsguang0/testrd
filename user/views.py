import json

from django.core import serializers
from django.http import HttpResponse
from django.shortcuts import render
from user.models import User

def search(request):
    if request.method == 'GET':
        result = {"message": 'success', "code": '0', "data": []}
        ls = User.objects.all()
        json_data = serializers.serialize('json', ls)
        result['data'] = json_data;
        return HttpResponse(json.dumps(result), content_type="application/json")


def index(request):
    return HttpResponse('Hello World')

