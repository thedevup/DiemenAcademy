from django.contrib import admin

# Register your models here.
#This is a relative import, we are selecting from the same file

from .models import Course, Exam, Result, Student, Study, Teacher

admin.site.register(Course)
admin.site.register(Exam)
admin.site.register(Result)
admin.site.register(Student)
admin.site.register(Study)
admin.site.register(Teacher)
