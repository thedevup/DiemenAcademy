"""TheCreativeGenius URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.urls import path

from dashboard.views import home_view, study_details_view, Teacher_details_view, student_details_view, student_create_view, results_view, results2_view, exams_view

urlpatterns = [
    path('create_student/', student_create_view, name='create_student'),
    path('students', student_details_view, name='students'),
	path('', home_view, name='home'),
	path('study_details/<int:StudyID>', study_details_view, name='study_details_id_path'),
	path('teachers/', Teacher_details_view, name='teachers'),
    path('results/<int:StudentID>', results_view, name='results'),
    path('results/', results2_view, name='results2'),
    path('exams', exams_view, name='exams'),
    path('admin/', admin.site.urls),
    path('login/', auth_views.LoginView.as_view(template_name = 'login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(template_name = 'logout.html'), name='logout'),
]
