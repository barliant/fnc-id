from django.shortcuts import render, redirect
from hoax.models import Corpus
from django.db import connection
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import csv
from django.http import HttpResponse	
from nltk.book import *
from collections import namedtuple

def namedtuplefetchall(cursor):
    "Return all rows from a cursor as a namedtuple"
    desc = cursor.description
    nt_result = namedtuple('Result', [col[0] for col in desc])
    return [nt_result(*row) for row in cursor.fetchall()]

# Create your views here.
def index(request):
	return redirect('/main')


@login_required(login_url="/accounts/login/")
def home(request):
	return render(request, 'hoax/home.html')


@login_required(login_url="/accounts/login/")
def checkhoax(request):
	return render(request, 'hoax/checkhoax.html')


@login_required(login_url="/accounts/login/")
def addcorpus(request):
	return render(request, 'hoax/addcorpus.html')


@login_required(login_url="/accounts/login/")
def input(request):
	print(request.POST)
	corpus = Corpus(title=request.POST['title'], corpus=request.POST['corpus'], label=request.POST['label'])
	corpus.save()
	return redirect('/viewcorpus')


@login_required(login_url="/accounts/login/")
def viewcorpus(request):
	corpora = Corpus.objects.all().order_by('id')
	page = request.GET.get('page', 1)
	paginator = Paginator(corpora, 7)
	try:
		corpora = paginator.page(page)
	except PageNotAnInteger:
		corpora = paginator.page(1)
	except EmptyPage:
		corpora = paginator.page(paginator.num_pages)

	context = {'corpora' : corpora}
	return render(request, 'hoax/viewcorpus.html', {'corpora' : corpora})


@login_required(login_url="/accounts/login/")
def delete(request, id):
	corpus = Corpus.objects.get(id=id)
	corpus.delete()
	return redirect('/viewcorpus') 


@login_required(login_url="/accounts/login/")
def detail(request, id):
	corpora = Corpus.objects.get(id=id)
	context = {'corpora' : corpora}
	return render(request, 'hoax/detailcorpus.html', context)

def result(request):
	cursor = connection.cursor()
	cursor.execute('SELECT * FROM hoax_result ORDER BY ID DESC LIMIT 1')
	row = namedtuplefetchall(cursor)
	pth = row[0].result_txt
	data = open(pth, 'r').read()
	img = row[0].result_img
	return render(request, 'hoax/result.html', {'data' : data, 'imej' : img})


@login_required(login_url="/accounts/login/")
def export(request):
    # Create the HttpResponse object with the appropriate CSV header.
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="corpusexport.csv"'

    writer = csv.writer(response)
    writer.writerow(['ID', 'Title', 'Corpus', 'Label', 'Created_at'])
   
    for row in Corpus.objects.raw('SELECT * FROM hoax_corpus ORDER BY id ASC'):
    	writer.writerow([row.id, row.title, row.corpus, row.label, row.created_at]) 
    return response

@login_required(login_url="/accounts/login/")
def analyze(request):
	print(request.POST)
	corpus = request.POST['label']
	process = request.POST['process']
	method = request.POST['method']
	normalize(corpus)
	
	cursor = connection.cursor()
	if process == 'stop':
		stopwords_removal(corpus)
		if method == 'wordcloud':
			im, tx = wordcloud(corpus)
			cursor.execute("INSERT INTO hoax_result (label, process, method, result_img, result_txt) VALUES ('%s', '%s', '%s', '%s', '%s')" % (corpus, process, method, im, tx))
		'''elif method == 'sna':
			sna(corpus)
		elif method == 'docvec':
			docvec(corpus)'''

	elif process == 'stem':
		stemming(corpus)
		if method == 'wordcloud':
			im, tx = wordcloud(corpus)
			cursor.execute("INSERT INTO hoax_result (label, process, method, result_img, result_txt) VALUES ('%s', '%s', '%s', '%s', '%s')" % (corpus, process, method, im, tx))
		'''elif method == 'sna':
			sna(corpus)
		elif method == 'docvec':
			docvec(corpus)'''

	elif process == 'stopstem':
		stop_stem(corpus)
		if method == 'wordcloud':
			im, tx = wordcloud(corpus)
			cursor.execute("INSERT INTO hoax_result (label, process, method, result_img, result_txt) VALUES ('%s', '%s', '%s', '%s', '%s')" % (corpus, process, method, im, tx))
		'''elif method == 'sna':
			sna(corpus)
		elif method == 'docvec':
			docvec(corpus)'''

	return redirect('/result')


def normalize(label):
	#code to remove symbol and lowercase corpus from db and save to label_normalize.txt file
	import itertools
	import re

	cursor = connection.cursor()
	cursor.execute("SELECT corpus FROM hoax_corpus WHERE label = '%s' ORDER BY id ASC"  % (label))
	row = cursor.fetchall()

	#joining list of tuple into list of str
	doc = [i for i in itertools.chain(*row)]
	#joining list of str into 1 list
	docs = ' '.join(doc)
	#lowercase
	low = docs.lower()
	#remove symbol and number
	new_doc = re.sub('[^a-zA-Z\n]', ' ', low)
	#write to file
	if label == 'Hoax':
		open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt', 'w').write(new_doc)
	elif label == 'Fakta':
		open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt', 'w').write(new_doc)	


def stopwords_removal(label): 
	#code to remove stopwords from normalize.txt and save to label_final.txt file
	if label == 'Hoax': 
		f1 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt', 'r')
		f3 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'w')
	elif label == 'Fakta':
		f1 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt', 'r')
		f3 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'w')

	f2 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/stopwords_id.txt', 'r')

	first_words=[]
	second_words=[]
	for line in f1:
	    words = line.split()
	    for w in words:
	        first_words.append(w)

	for line in f2:
	    w = line.split()
	    for i in w:
	        second_words.append(i)


	for word1 in first_words :
	    for word2 in second_words:
	        if word1 == word2:
	            while True:
	                try:
	                    first_words.remove(word2)
	                except:
	                    break
	            

	for word in first_words:
	    f3.write(word)
	    f3.write(' ')

	f1.close()
	f2.close()
	f3.close()


def stemming(label):	
	#code to stem corpus from normalize.txt and save to label_final.txt file
	from Sastrawi.Stemmer.StemmerFactory import StemmerFactory
	factory = StemmerFactory()
	stemmer = factory.create_stemmer()
	if label == 'Hoax':
		file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt').read()
		final = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'w')
	elif label == 'Fakta':
		file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt').read()
		final = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'w')
	
	stemmed = stemmer.stem(file)
	final.write(stemmed)
	final.close()


def stop_stem(label):	
	#code to remove stopwords and stem corpus from normalize.txt and save to label_final.txt file
	from Sastrawi.Stemmer.StemmerFactory import StemmerFactory
	
	if label == 'Hoax': 
		f1 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt', 'r')
		f3 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'w')
	elif label == 'Fakta':
		f1 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt', 'r')
		f3 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'w')

	f2 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/stopwords_id.txt', 'r')

	first_words=[]
	second_words=[]
	for line in f1:
	    words = line.split()
	    for w in words:
	        first_words.append(w)

	for line in f2:
	    w = line.split()
	    for i in w:
	        second_words.append(i)


	for word1 in first_words :
	    for word2 in second_words:
	        if word1 == word2:
	            while True:
	                try:
	                    first_words.remove(word2)
	                except:
	                    break
	  
	factory = StemmerFactory()
	stemmer = factory.create_stemmer()          
	docs = ' '.join(first_words)
	stemmed = stemmer.stem(docs)
	f3.write(stemmed)
	f3.close()

	f1.close()
	f2.close()
	f3.close()


def wordcloud(label):	
	#code to make wordcloud from label_final.txt
	from wordcloud import WordCloud
	import matplotlib.pyplot as plt
	
	if label == 'Hoax':	
		file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'r')
		fig = 'hoax_wc.png'
		out = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_result_analysis.txt'
	elif label == 'Fakta':
		file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'r') 
		fig = 'fakta_wc.png'
		out = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_result_analysis.txt'
	path = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/'
	text = file.read()
	#generate wordcloud image
	wc = WordCloud().generate(text)
	wc.to_file(path+fig)

	#generate analysis
	import nltk

	token = nltk.word_tokenize(text)
	freq = FreqDist(token).most_common(10)
	teks = '10 kata terbanyak pada corpus ' + label + ' adalah: \n'
	
	outfile = open(out, 'w')
	outfile.write(teks)
	index = 0
	while index < len(freq):
		outfile.write( freq[index][0] + "\n")
		index += 1

	return fig, out




'''
def sna(label):	#code to make sna from label_final.txt 


def docvec(label):	#code to make doc2vec analysis from label_final.txt'''
