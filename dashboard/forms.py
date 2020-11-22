from django import forms
from .models import Student

class StudentForm(forms.ModelForm):
	class Meta:
		model = Student
		fields = [
			'first_name',
			'last_name',
			'date_of_birth',
			'nationality',
			'gender',
			'street_name',
			'street_number',
			'postal_code',
			'postal_code',
			'city',
			'phone',
			'email',
			'study_id_study',
			'start_year',
			'teacher_id_teacher',
			]