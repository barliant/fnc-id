from django.db import models

# Create your models here.
class Hoax(models.Model):
	corpus = models.TextField()
	label = models.NullBooleanField()
	created_at = models.DateTimeField(auto_now_add = True) #auto now pada saat add perdana saja
	updated_at = models.DateTimeField(auto_now = True)