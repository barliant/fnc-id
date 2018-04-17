from django.db import models

# Create your models here.
class Corpus(models.Model):
	title = models.TextField()
	corpus = models.TextField()
	label = models.TextField()
	created_at = models.DateTimeField(auto_now_add = True) #auto now pada saat add perdana saja
	updated_at = models.DateTimeField(auto_now = True)

class Result(models.Model):
	label = models.TextField()
	process = models.TextField()
	method = models.TextField()
	result = models.TextField()