from django.urls import path
from . import views

urlpatterns = [
    path('dashboard', views.index, name='index'),
    path('dashboard/available-spaces', views.availableSpace, name='availableSpaces'),
    path('dashboard/hostel-application', views.hostelApplication, name='hostelApplication'),
    path('dashboard/hostel-application/apply', views.submitApplication, name='submitApplication'),
    path('dashboard/application-status', views.applicationStatus, name='applicationStatus'),
    path('', views.login, name='login'),
    path('dashboard/authUser', views.auth, name='auth'),
    path('dashboard/logout', views.logout, name='logout'),
    path('getRoom', views.getRoom, name='getRoom'), 
    path('getRooms', views.getRooms, name='getRooms'),
    path('getBunk', views.getBunk, name='getBunk'),
    path('saveApplication', views.saveApplication, name='saveApplication'),
    path('create-bunk', views.createRooms, name='createRooms'),
    path('create-rooms', views.createRoom, name='createRoom'),
]
