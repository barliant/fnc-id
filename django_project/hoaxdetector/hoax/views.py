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
		elif method == 'sna':
			im, tx = sna(corpus)
		elif method == 'docvec':
			im, tx = docvec(corpus)

	elif process == 'stem':
		stemming(corpus)
		if method == 'wordcloud':
			im, tx = wordcloud(corpus)	
		elif method == 'sna':
			im, tx = sna(corpus)
		elif method == 'docvec':
			im, tx = docvec(corpus)
			
	elif process == 'stopstem':
		stop_stem(corpus)
		if method == 'wordcloud':
			im, tx = wordcloud(corpus)
		elif method == 'sna':
			im, tx = sna(corpus)
		elif method == 'docvec':
			im, tx = docvec(corpus)

	cursor.execute("INSERT INTO hoax_result (label, process, method, result_img, result_txt) VALUES ('%s', '%s', '%s', '%s', '%s')" % (corpus, process, method, im, tx))
	return redirect('/result')


def normalize(label):
	#code to remove symbol and lowercase corpus from db and save to label_normalize.txt file
	import itertools
	import re

	cursor = connection.cursor()
	if label == 'All':
		cursor.execute("SELECT corpus FROM hoax_corpus ORDER BY id ASC")
	else:
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
		#open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt', 'w').write(new_doc)
		open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt', 'w').write(new_doc)
	elif label == 'Fakta':
		#open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt', 'w').write(new_doc)
		open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt', 'w').write(new_doc)
	elif label == 'All':
		#open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_normalize.txt', 'w').write(new_doc)	
		open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_normalize.txt', 'w').write(new_doc)


def stopwords_removal(label): 
	#code to remove stopwords from normalize.txt and save to label_final.txt file
	if label == 'Hoax': 
		#f1 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt', 'r')
		f1 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt', 'r')
		#f3 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'w')
		f3 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'w')
	elif label == 'Fakta':
		#f1 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt', 'r')
		f1 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt', 'r')
		#f3 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'w')
		f3 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'w')
	elif label == 'All':
		#f1 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_normalize.txt', 'r')
		f1 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_normalize.txt', 'r')
		#f3 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_final.txt', 'w')
		f3 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_final.txt', 'w')

	#f2 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/stopwords_id.txt', 'r')
	f2 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/stopwords_id.txt', 'r')

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
		#file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt').read()
		file = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt').read()
		#final = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'w')
		final = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'w')
	elif label == 'Fakta':
		#file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt').read()
		file = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt').read()
		#final = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'w')
		final = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'w')
	elif label == 'All':
		#file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_normalize.txt').read()
		file = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_normalize.txt').read()
		#final = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_final.txt', 'w')
		final = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_final.txt', 'w')
	
	stemmed = stemmer.stem(file)
	final.write(stemmed)
	final.close()


def stop_stem(label):	
	#code to remove stopwords and stem corpus from normalize.txt and save to label_final.txt file
	from Sastrawi.Stemmer.StemmerFactory import StemmerFactory
	
	if label == 'Hoax': 
		#f1 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt', 'r')
		f1 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_normalize.txt', 'r')
		#f3 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'w')
		f3 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'w')
	elif label == 'Fakta':
		#f1 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt', 'r')
		f1 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_normalize.txt', 'r')
		#f3 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'w')
		f3 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'w')
	elif label == 'All':
		#f1 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_normalize.txt', 'r')
		f1 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_normalize.txt', 'r')
		#f3 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_final.txt', 'w')
		f3 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_final.txt', 'w')

	#f2 = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/stopwords_id.txt', 'r')
	f2 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/stopwords_id.txt', 'r')
	
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
		#file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'r')
		file = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'r')
		fig = 'hoax_wc.png'
		#out = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_result_analysis.txt'
		out = 'D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_result_analysis.txt'
	elif label == 'Fakta':
		#file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'r') 
		file = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'r')
		fig = 'fakta_wc.png'
		#out = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_result_analysis.txt'
		out = 'D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_result_analysis.txt'
	elif label == 'All':
		#file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_final.txt', 'r')
		file = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_final.txt', 'r')		
		fig = 'all_wc.png'
		#out = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_result_analysis.txt'
		out = 'D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_result_analysis.txt'
	
	#path = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/'
	path = 'D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/'
	
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


def sna(label):	
	#code to make sna from label_final.txt 
	import networkx as nx
	import matplotlib.pyplot as plt
	from operator import itemgetter

	G = nx.Graph()

	if label == 'Hoax':	
		#file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'r')
		file = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt', 'r')
		fig = 'hoax_sna.png'
		#out = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_result_analysis.txt'
		out = 'D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_result_analysis.txt'
	elif label == 'Fakta':
		#file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'r') 
		file = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt', 'r')
		fig = 'fakta_sna.png'
		#out = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_result_analysis.txt'
		out = 'D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_result_analysis.txt'
	elif label == 'All':
		#file = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_final.txt', 'r')
		file = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_final.txt', 'r')		
		fig = 'all_sna.png'
		#out = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_result_analysis.txt'
		out = 'D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_result_analysis.txt'
	
	#path = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/'
	path = 'D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/'
	
	#add edges to network
	doc = file.read()
	words = doc.split()
	i = 0
	for idx in range(1, len(words)):
		G.add_edge(words[idx-1], words[idx])
		i += 1

	#draw graph
	labels = {}
	for idx in range(len(words)):
		labels[idx] = words[idx]

	pos = nx.spring_layout(G)
	nx.draw(G, pos, node_color = '#A0CBE2', font_size = 5, scale = 3, edge_color='#BB0000', width=2, edge_cmap=plt.cm.Blues, with_labels=True)
	plt.savefig(path+fig, dpi = 1000)

	#degree centrality
	deg_cen = nx.degree_centrality(G)
	sorted_degcen = sorted(deg_cen.items(), key=itemgetter(1), reverse=True)

	#betweenness centrality
	bet_cen = nx.betweenness_centrality(G)
	sorted_betcen = sorted(bet_cen.items(), key=itemgetter(1), reverse=True)

	#closeness centrality
	clo_cen = nx.closeness_centrality(G)
	sorted_clocen = sorted(clo_cen.items(), key=itemgetter(1), reverse=True)

	teks1 = '20 Node paling sentral adalah: \n 1. Degree Centrality : \n'
	outfile = open(out, 'w')
	outfile.write(teks1 + "\n")
	for b in sorted_degcen[:20]:
		outfile.write( b[0] + ", \n")
	teks2 = '2. Betweenness Centrality : \n'
	outfile.write(teks2 + "\n")
	for b in sorted_betcen[:20]:
		outfile.write( b[0] + ", \n")
	teks3 = '3. Closeness Centrality : \n'
	outfile.write(teks3 + "\n")
	for b in sorted_clocen[:20]:
		outfile.write( b[0] + ", \n")

	return fig, out




	'''for n in G:
		G.node[n]['name'] = n
	d = json_graph.node_link_data(G)
	json.dump(d, open(fig, 'w'))

	import http_server
	http_server.load_url(outfig)'''




def docvec(label):	#code to make doc2vec analysis from label_final.txt
	from gensim import models
	if label == 'All':
		#file_f = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt').read()
		file_f = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/fakta_final.txt').read()
		#file_h = open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt').read()
		file_h = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/hoax_final.txt').read()
		fig = 'all_docvec.png'
		#out = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_result_analysis.txt'
		out = 'D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/all_result_analysis.txt'
		
	#path = '/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/'
	path = 'D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/'
	
	list_f = file_f.split()
	list_h = file_h.split()

	sentence = models.doc2vec.LabeledSentence(
    words=list_f, tags=["SENT_fakta"])
	sentence1 = models.doc2vec.LabeledSentence(
    words=list_h, tags=["SENT_hoax"])

	sentences = [sentence, sentence1]
	token_count = sum([len(sentence) for sentence in sentences])

	#???????
	class LabeledLineSentence(object):
	    def __init__(self, filename):
	        self.filename = filename
	    def __iter__(self):
	        for uid, line in enumerate(open(filename)):
	            yield LabeledSentence(words=line.split(), labels=['SENT_%s' % uid])
	            
	model = models.Doc2Vec(dm=0, alpha=.025, min_alpha=.025, min_count=1)
	model.build_vocab(sentences)

	for epoch in range(10):
	    model.train(sentences, total_examples = token_count, epochs = model.iter)
	    model.alpha -= 0.002  # decrease the learning rate`
	    model.min_alpha = model.alpha  # fix the learning rate, no decay

	#model.save("/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/my_model.doc2vec")
	model.save('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/my_model.doc2vec')
	#model_loaded = models.Doc2Vec.load('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/my_model.doc2vec')
	model_loaded = models.Doc2Vec.load('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/my_model.doc2vec')
	
	cosine_similarities = []
	for r in range(2):
		for t in range(r+1, 2):
			cosine_similarities.append(model.docvecs.similarity(r,t))
	teks = 'Nilai Cosine Similarities antara corpus hoax dan fakta adalah sebesar: '+ str(cosine_similarities)
	outfile = open(out, 'w')
	outfile.write(teks)

	import matplotlib.pyplot as pl
	pl.hist(cosine_similarities, 50, facecolor='green', alpha=0.5)
	pl.title('Distribution of Cosine Similarities')
	pl.ylabel('Frequency')
	pl.xlabel('Cosine Similarity')
	pl.savefig(path+fig)

	return fig, out
