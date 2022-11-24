from django.db import models

# Create your models here.
class Users(models.Model):
  name = models.CharField(max_length=255)
  reg_number = models.CharField(max_length=255)
  passcode = models.CharField(max_length=255)
  department = models.CharField(max_length=70)
  faculty = models.CharField(max_length=70)
  email = models.CharField(max_length=255)
  dob = models.CharField(max_length=70)
  session = models.CharField(max_length=15)
  semester = models.CharField(max_length=70)
  passport = models.CharField(max_length=70)
  program_type = models.CharField(max_length=70)
  rrr = models.IntegerField(max_length=20)
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