from django.conf.urls import url
from . import views

app_name = 'main'

urlpatterns = [
	url(r'^$', views.index, name="index"),
	url(r'^analisa$', views.analyze, name="analisa"),
	url(r'^hasil$', views.result),
]
