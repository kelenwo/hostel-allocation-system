from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('dashboard/available-spaces', views.availableSpace, name='availableSpaces'),
    path('dashboard/hostel-application', views.hostelApplication, name='hostelApplication'),
    path('dashboard/hostel-application/apply', views.submitApplication, name='submitApplication'),
    path('dashboard/application-status', views.applicationStatus, name='applicationStatus'),
    path('login', views.login, name='login'),
]
