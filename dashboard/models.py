from django.db import models
import os
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Create your models here.
class Course(models.Model):
    id_course = models.AutoField(primary_key=True)
    course_name = models.CharField(max_length=45, blank=True, null=True)
    description = models.CharField(max_length=45, blank=True, null=True)
    credits = models.CharField(max_length=45, blank=True, null=True)
    teacher_id_teacher = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='teacher_id_teacher')
    study_id_study = models.ForeignKey('Study', models.DO_NOTHING, db_column='study_id_study')

    class Meta:
        managed = False
        db_table = 'Course'



class Exam(models.Model):
    id_exam = models.AutoField(primary_key=True)
    room = models.CharField(max_length=45, blank=True, null=True)
    resit = models.CharField(max_length=45, blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    time = models.TimeField(blank=True, null=True)
    course_id_course = models.ForeignKey(Course, models.DO_NOTHING, db_column='course_id_course')

    class Meta:
        managed = False
        db_table = 'Exam'



class Result(models.Model):
    id_result = models.AutoField(primary_key=True)
    grade = models.IntegerField(blank=True, null=True)
    exam_id_exam = models.ForeignKey(Exam, models.DO_NOTHING, db_column='exam_id_exam')
    date = models.DateField(blank=True, null=True)
    student_id_student = models.ForeignKey('Student', models.DO_NOTHING, db_column='student_id_student')
    passed = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Result'



class Student(models.Model):
    id_student = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=45)
    last_name = models.CharField(max_length=45)
    date_of_birth = models.DateField()
    nationality = models.CharField(max_length=45)
    gender = models.CharField(max_length=1)
    street_name = models.CharField(max_length=45)
    street_number = models.CharField(max_length=45)
    postal_code = models.CharField(max_length=45)
    city = models.CharField(max_length=45)
    phone = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    study_id_study = models.ForeignKey('Study', models.DO_NOTHING, db_column='study_id_study')
    start_year = models.CharField(max_length=45)
    teacher_id_teacher = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='teacher_id_teacher', related_name = 'tcr_id')

    class Meta:
        managed = False
        db_table = 'Student'

    

class Study(models.Model):
    id_study = models.IntegerField(primary_key=True)
    study_name = models.CharField(max_length=45)
    description = models.CharField(max_length=45, blank=True, null=True)
    language = models.CharField(max_length=45)
    number_of_years = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'Study'



class Teacher(models.Model):
    id_teacher = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=45, blank=True, null=True)
    last_name = models.CharField(max_length=45, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    nationality = models.CharField(max_length=45, blank=True, null=True)
    street_name = models.CharField(max_length=45, blank=True, null=True)
    street_number = models.CharField(max_length=45, blank=True, null=True)
    postal_code = models.CharField(max_length=45, blank=True, null=True)
    city = models.CharField(max_length=45, blank=True, null=True)
    phone = models.CharField(max_length=45, blank=True, null=True)
    gender = models.CharField(max_length=1, blank=True, null=True)
    salary = models.CharField(max_length=45, blank=True, null=True)
    study_counselor = models.CharField(max_length=45, blank=True, null=True)
    teacher_pic = models.ImageField(upload_to ='thecreativegenius/templates/pictures', default = '')

    class Meta:
        managed = True
        db_table = 'Teacher'




class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    user_type = models.CharField(max_length=45, blank=True, null=True)
    student_user_id = models.ForeignKey('Student', models.DO_NOTHING, db_column='student_user_id', blank=True, null=True)
    teacher_user_id = models.ForeignKey('Teacher', models.DO_NOTHING, db_column='teacher_user_id', blank=True, null=True)




@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()
