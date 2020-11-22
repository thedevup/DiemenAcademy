from django.shortcuts import render
from .models import Study, Student, Course, Teacher, Exam, Result
from .forms import StudentForm

# Create your views here.
def home_view(request, *args, **kwargs):
	std = Study.objects.raw('SELECT * FROM study')


	context = {
		'std':std,
	}
	return render(request, "home.html", context)

def study_details_view(request, StudyID, *args, **kwargs):
	#obj = Study.objects.all()
	
	stdnt = Student.objects.raw('SELECT * FROM Student WHERE study_id_study = ' + str(StudyID) + ';')
	crs = Course.objects.raw('SELECT * FROM Course WHERE study_id_study = ' + str(StudyID) + ';')
	#rslt = Result.objects.raw('SELECT * FROM Result INNER JOIN Exam ON (Result.exam_id_exam = Exam.id_exam) INNER JOIN Course ON (Exam.course_id_course = Course.id_course) WHERE Course.study_id_study = ' + str(StudyID) + ';')

	context = {
		'stdnt':stdnt,
		'crs':crs,
	#	'teacherid':teacherid,
	}
	return render(request, "study_details.html", context)



def results_view(request,StudentID , *args, **kwargs):
	rslt = Result.objects.raw('SELECT * FROM Result WHERE student_id_student = ' + str(StudentID) + ';')

	context = {
		'rslt':rslt,
	}

	return render(request, "results.html", context)


def results2_view(request, *args, **kwargs):
	rslt = Result.objects.raw('SELECT * FROM Result')

	context = {
		'rslt':rslt,
	}

	return render(request, "results2.html", context)


def exams_view(request, *args, **kwargs):
	exm = Exam.objects.raw('SELECT * FROM Exam')

	context = {
		'exm':exm,
	}

	return render(request, "exams.html", context)


def Teacher_details_view(request, *args, **kwargs):

	tcr = Teacher.objects.raw('SELECT * FROM Teacher')
	context = {
		'tcr':tcr
	}
	return render(request, "teachers_detail.html", context)

def student_details_view(request, *args, **kwargs):
	stdnt = Student.objects.raw('SELECT * FROM Student;')

	context = {
		'stdnt':stdnt,
	}
	return render(request, "students_detail.html", context)

def student_create_view(request, *args, **kwargs):
	form = StudentForm(request.POST or None)
	if form.is_valid():
		form.save()

	context = {
		'form':form,
	}
	return render(request, "student_create.html", context)





























