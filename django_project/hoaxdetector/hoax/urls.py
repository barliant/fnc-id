from django.conf.urls import url
from . import views

urlpatterns = [
	url(r'^$', views.index),
	url(r'^checkhoax$', views.checkhoax),
	url(r'^addcorpus$', views.addcorpus),
	url(r'^addcorpus/input$', views.input),
	url(r'^viewcorpus$', views.viewcorpus),
]
