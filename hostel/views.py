from django.shortcuts import render, redirect
from django.template import loader
from django.contrib.sessions.models import Session
from django.http import JsonResponse, HttpResponse
import requests, base64
from bs4 import BeautifulSoup
from .models import *


def index(request):
    try:
        print(request.session['user'])
    except KeyError:
        return redirect('/')
    context = {
    'session': request.session['user']
        }
    # print(request.session.keys())
    template = loader.get_template('index.html')
    return HttpResponse(template.render(context, request))

def availableSpace(request):

    try:
        print(request.session['user'])
    except KeyError:
        return redirect('/')

    context = {
    'session': request.session['user']
        }
    template = loader.get_template('spaces.html')
    return HttpResponse(template.render(context, request))

def applicationStatus(request):
    try:
        print(request.session['user'])
    except KeyError:
        return redirect('/')

    find = Applications.objects.filter(reg_number=request.session['user']['reg_number'])
    apps = False
    bunk = False
    room = False
    if len(find) > 0:
       apps = find[0]
       bunk = apps.bunk_id,
       room = apps.room_id.replace('rm', 'Room ')


    context = {
    'session': request.session['user'],
    'apps': apps,
    'bunk': bunk,
    'room': room
    }
    template = loader.get_template('appstatus.html')
    return HttpResponse(template.render(context, request))

def submitApplication(request):
    try:
        print(request.session['user'])
    except KeyError:
        return redirect('/')

    context = {
    'session': request.session['user']
        }
    template = loader.get_template('applyspace.html')
    return HttpResponse(template.render(context, request))

def hostelApplication(request):
    try:
        print(request.session['user'])
    except KeyError:
        return redirect('/')

    find = Applications.objects.filter(reg_number=request.session['user']['reg_number'])
    apps = ''
    bunk = ''
    room = ''
    if len(find) > 0:
       apps = find[0]
       bunk = apps.bunk_id,
       room = apps.room_id.replace('rm', 'Room ')


    context = {
    'session': request.session['user'],
    'apps': apps,
    'bunk': bunk,
    'room': room
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
    print(list(findroom))
    return JsonResponse({"rooms": list(findroom)})

def getRooms(request):
    
    post = request.POST
    findroom = Rooms.objects.filter(hostel = post['hostel']).values()
    # print(list(findroom))
    # print(findroom[1]['room_id'])
    array = []
    for room in findroom:
        countroom = Applications.objects.filter(room_id = room['room_id']).count()
        h = ''
        if room['hostel'] == 'mph':
            h = 'Male Presidential Hostel'
        else:
            h = 'Female Presidential Hostel'
        arr = {'id': room['id'],'room_id': room['room_id'], 'room': room['room'], 'room_count':countroom, 'hostel': h}
        array.append(arr)
    # print(array)

    return JsonResponse({"rooms": array})

def getBunk(request):
    
    post = request.POST
    findbunk = Spaces.objects.filter(hostel = post['hostel'], room_id=post['rooms']).values()
    # print(findbunk[1])
    return JsonResponse({"bunk": list(findbunk)})


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

                findimg = html2.find_all('img')
                img = findimg[1].get('src')
                # print(arr)   
                user = Users(name=arr[1], reg_number=post["reg_number"], passcode=post["passcode"], passport=img,
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
            # print(arr) 

            findimg = html2.find_all('img')
            img = findimg[1].get('src')  
            user = Users(name=arr[1], reg_number=post["reg_number"], passcode=post["passcode"], passport=img,
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

def saveApplication(request):
    post = request.POST
    user = request.session['user']
    # print(user['name'])
    apps = Applications(name=user['name'],reg_number=user['reg_number'],department=user['department'],faculty=user['faculty'],hostel=post['hostel'],
                bunk_id=post['bunk_id'],room_id=post['rooms'],email=user['email'],status='approved')

    apps.save()
    space = Spaces.objects.get(bunk_id=post['bunk_id'], room_id=post['rooms'], hostel=post['hostel'])
    space.status = 1
    space.save()
    return JsonResponse({"status": 'success'})

def createRooms(request):
    arr = ['A1','A2','B1','B2','C1','C2','D1','D2']
    arr2 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    for num in arr2:
        for i in arr:
            rooms = Spaces(room='Room '+str(num),hostel='mph', room_id='rm'+str(num), bunk_id=i)
            rooms.save()
    return redirect('/dashboard')

def createRoom(request):
    arr2 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    for num in arr2:
        rooms = Rooms(room='Room '+str(num),hostel='mph', room_id='rm'+str(num))
        rooms.save()
    return redirect('/dashboard')

def logout(request):
    request.session.flush()
    return redirect('/')