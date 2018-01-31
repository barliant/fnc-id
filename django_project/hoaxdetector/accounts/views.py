from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required

# Create your views here.

@login_required(login_url="/accounts/login/")
def signup_view(request):
	if request.method == 'POST':
		form = UserCreationForm(request.POST) #buat baca ada data yg dientry di form atau tidak
		if form.is_valid():
			form.save() 
			return redirect('/')
	else:
		form = UserCreationForm()

	return render(request, 'accounts/signup.html', {'form': form})


def login_view(request):
	if request.method == 'POST':
		form = AuthenticationForm(data=request.POST) #buat baca ada data yg dientry di form atau tidak
		if form.is_valid():
			#log in function
			user = form.get_user() #get the user data from variable form
			login(request, user) #log the user in
			return redirect('/')

	else:
		form = AuthenticationForm()

	return render(request, 'accounts/login.html', {'form': form})


def logout_view(request):
	logout(request)
	return redirect('/accounts/login/')
