from django.conf.urls import url
from . import views

urlpatterns = [
	url(r'^$', views.index),
	url(r'^home$', views.home),
	url(r'^checkhoax$', views.checkhoax),
	url(r'^addcorpus$', views.addcorpus),
	url(r'^addcorpus/input$', views.input),
	url(r'^viewcorpus$', views.viewcorpus),
	url(r'^delete/(?P<id>\d+)$', views.delete),
	url(r'^detail/(?P<id>\d+)$', views.detail),
	url(r'^export$', views.export),
	url(r'^checkhoax/analyze$', views.analyze),
]
