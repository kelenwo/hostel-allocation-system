from django.db import models

# Create your models here.
class Users(models.Model):
  name = models.CharField(max_length=255)
  reg_number = models.CharField(max_length=255)
  passcode = models.CharField(max_length=255, null=True)
  department = models.CharField(max_length=70)
  faculty = models.CharField(max_length=70)
  email = models.CharField(max_length=255)
  dob = models.CharField(max_length=70, null=True)
  session = models.CharField(max_length=15, null=True)
  semester = models.CharField(max_length=70, null=True)
  passport = models.CharField(max_length=70, null=True)
  program_type = models.CharField(max_length=70, null=True)
  rrr = models.IntegerField(null=True)
  app_status = models.CharField(max_length=15)


class Applications(models.Model):
  name = models.CharField(max_length=255)
  reg_number = models.CharField(max_length=255)
  department = models.CharField(max_length=70)
  faculty = models.CharField(max_length=70)
  hostel = models.CharField(max_length=70)
  room_id = models.CharField(max_length=20)
  bunk_id = models.CharField(max_length=20)
  email = models.CharField(max_length=255)
  session = models.CharField(max_length=20)
  status = models.CharField(max_length=15)
  date = models.CharField(max_length=50)

class Spaces(models.Model):
  room = models.CharField(max_length=100, null=True)
  hostel = models.CharField(max_length=255, null=True)
  room_id = models.CharField(max_length=20, null=True)
  bunk_id = models.CharField(max_length=20, null=True)
  status = models.IntegerField(null=True)

class Rooms(models.Model):
  room = models.CharField(max_length=100, null=True)
  hostel = models.CharField(max_length=255, null=True)
  room_id = models.CharField(max_length=20, null=True)
  