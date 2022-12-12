from django.shortcuts import render
from django.template import loader
from django.contrib.sessions.models import Session
from django.http import JsonResponse, HttpResponse
import requests, base64
from bs4 import BeautifulSoup
from .models import *


def index(request):
    context = {
    'session': request.session['user']
        }
    # print(request.session.keys())
    template = loader.get_template('index.html')
    return HttpResponse(template.render(context, request))

def availableSpace(request):
    context = {
    'session': request.session['user']
        }
    template = loader.get_template('spaces.html')
    return HttpResponse(template.render(context, request))

def applicationStatus(request):
    context = {
    'session': request.session['user']
        }
    template = loader.get_template('spaces.html')
    return HttpResponse(template.render(context, request))

def submitApplication(request):
    context = {
    'session': request.session['user']
        }
    template = loader.get_template('applyspace.html')
    return HttpResponse(template.render(context, request))

def hostelApplication(request):
    context = {
    'session': request.session['user']
        }
    template = loader.get_template('apply.html')
    return HttpResponse(template.render(context, request))


def login(request):
    # print(request.session['name'])

    template = loader.get_template('login.html')
    return HttpResponse(template.render({}, request))
    
def getRoom(request):
    
    post = request.POST
    findroom = Rooms.objects.filter(hostel = post['hostel']).values()
    return JsonResponse({"rooms": list(findroom)})

def getBunk(request):
    
    post = request.POST
    findbunk = Spaces.objects.filter(hostel = post['hostel'], room=post['room']).values()
    return JsonResponse({"rooms": list(findbunk)})


def auth(request):
    post = request.POST  
    status = ''  
    reg = post["reg_number"].encode('ascii')
    passcode = post['passcode'].encode('utf-8')

    eportal = 'https://uniuyo.edu.ng/eportals'
    loginurl = 'https://uniuyo.edu.ng/mvc/model/dbstudents.php?jsonObj={"RegNo":"'+str(base64.b64encode(reg).decode('utf-8'))+'","AccessCode":"'+str(base64.b64encode(passcode).decode('utf-8'))+'","ScriptID":1,"Type":0}'
    dashboard = 'https://uniuyo.edu.ng/eportals/dashboard.php'
    headers = {
                'authority': 'uniuyo.edu.ng',
                'accept': '*/*',
                'accept-language': 'en-GB,en-NG;q=0.9,en-US;q=0.8,en;q=0.7',
                'content-type': 'application/x-www-form-urlencoded',
                'origin': 'https://uniuyo.edu.ng',
                'referer': 'https://uniuyo.edu.ng/eportals/index.php',
                'sec-ch-ua': '"Google Chrome";v="107", "Chromium";v="107", "Not=A?Brand";v="24"',
                'sec-ch-ua-mobile': '?1',
                'sec-ch-ua-platform': '"Android"',
                'sec-fetch-dest': 'empty',
                'sec-fetch-mode': 'cors',
                'sec-fetch-site': 'same-origin',
                'user-agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36',
        }
    try:
        finduser = Users.objects.filter(reg_number = post['reg_number']).values()
        if len(finduser) > 0:
            userdata = finduser[0]
            if(userdata['passcode'] == post['passcode']):
                # request.session = userdata
                request.session['user'] = userdata

                status = 'ok'
            else:
                status = '<span style="color:#900;font-size:12pt"><i class="fa fa-exclamation-triangle"></i> Invalid Login Details!!</span>'
        else:
            s = requests.Session()
            response = s.get(eportal, headers=headers)

            cookieJar = s.cookies
            initLogin = s.post(loginurl, headers=headers)
            cookieJar = s.cookies

            html = BeautifulSoup(initLogin.text, 'html.parser')
            
            if(str(html) =="ok"):
                
                res2= s.get(dashboard,cookies=cookieJar,headers=headers)

                html2 = BeautifulSoup(res2.text, 'html.parser')
                arr = []
                for link in html2.find_all('input'):
                    arr.append(link.get('placeholder'))
                print(arr)   
                user = Users(name=arr[1], reg_number=post["reg_number"], passcode=post["passcode"],
                            faculty=arr[2], email=arr[3], program_type=arr[4],dob=arr[5],department=arr[6],semester=arr[7])
                
                user.save()
                finduser = Users.objects.filter(reg_number = post['reg_number']).values()
                userdata = finduser[0]
                request.session['user'] = userdata
                status = 'ok'
            else:
                status = str(html)

        return JsonResponse({"status": status})
        
    except Users.DoesNotExist:
        s = requests.Session()
        response = s.get(eportal, headers=headers)

        cookieJar = s.cookies
        initLogin = s.post(loginurl, headers=headers)
        cookieJar = s.cookies

        html = BeautifulSoup(initLogin.text, 'html.parser')
        
        if(str(html) =="ok"):
            
            res2= s.get(dashboard,cookies=cookieJar,headers=headers)

            html2 = BeautifulSoup(res2.text, 'html.parser')
            arr = []
            for link in html2.find_all('input'):
                arr.append(link.get('placeholder'))
            print(arr)   
            user = Users(name=arr[1], reg_number=post["reg_number"], passcode=post["passcode"],
                        faculty=arr[2], email=arr[3], program_type=arr[4],dob=arr[5],department=arr[6],semester=arr[7])
            
            user.save()
            finduser = Users.objects.filter(reg_number = post['reg_number']).values()
            userdata = finduser[0]
            request.session['user'] = userdata
            status = 'ok'
        else:
            status = str(html)
        return JsonResponse({"status": status})

    # template = loader.get_template('login.html')
    # return HttpResponse(template.render())

def createRooms(request):
    arr = ['A1','A2','B1','B2','C1','C2','D1','D2']
    arr2 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    for num in arr2:
        for i in arr:
            rooms = Spaces(room='Room '+str(num),hostel='mph', room_id='rm'+str(num), bunk_id=i)
            rooms.save()