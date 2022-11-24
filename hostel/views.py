from django.shortcuts import render
from django.template import loader
from django.http import HttpResponse


def index(request):
    template = loader.get_template('index.html')
    return HttpResponse(template.render())

def availableSpace(request):
    template = loader.get_template('spaces.html')
    return HttpResponse(template.render())

def applicationStatus(request):
    template = loader.get_template('spaces.html')
    return HttpResponse(template.render())

def submitApplication(request):
    template = loader.get_template('applyspace.html')
    return HttpResponse(template.render())

def hostelApplication(request):
    template = loader.get_template('apply.html')
    return HttpResponse(template.render())

def login(request):
    template = loader.get_template('login.html')
    return HttpResponse(template.render())