from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
def index(request):
    raise Exception('Failed from index')
    # return HttpResponse("Hello world you are at polls")



