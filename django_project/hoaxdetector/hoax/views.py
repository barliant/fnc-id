from django.shortcuts import render

# Create your views here.
def index(request):
	return render(request, 'hoax/index.html')

def checkhoax(request):
	return render(request, 'hoax/checkhoax.html')

def addcorpus(request):
	return render(request, 'hoax/addcorpus.html')

def viewcorpus(request):
	return render(request, 'hoax/viewcorpus.html')