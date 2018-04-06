from django.shortcuts import render, redirect
from hoax.models import Hoax
from django.db import connection
from gensim import corpora
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import csv
from django.http import HttpResponse

# Create your views here.
def index(request):
	return redirect('/home')


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
	corpus = Hoax(corpus=request.POST['corpus'], label = None)
	corpus.save()
	vslda()
	return redirect('/viewcorpus')


@login_required(login_url="/accounts/login/")
def viewcorpus(request):
	corpora = Hoax.objects.all().order_by('id')
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
	corpus = Hoax.objects.get(id=id)
	corpus.delete()
	return redirect('/viewcorpus') 


@login_required(login_url="/accounts/login/")
def detail(request, id):
	corpora = Hoax.objects.get(id=id)
	context = {'corpora' : corpora}
	return render(request, 'hoax/detailcorpus.html', context)


@login_required(login_url="/accounts/login/")
def train(request):
	vslda()
	return redirect('/viewcorpus') 


@login_required(login_url="/accounts/login/")
def export(request):
    # Create the HttpResponse object with the appropriate CSV header.
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="corpusexport.csv"'

    writer = csv.writer(response)
    writer.writerow(['ID', 'Corpus', 'Label', 'Created_at'])
   
    for row in Hoax.objects.raw('SELECT * FROM hoax_hoax ORDER BY id ASC'):
    	writer.writerow([row.id, row.corpus, row.label, row.created_at]) 
    return response


def vs():

    cursor = connection.cursor()
    cursor.execute("SELECT corpus FROM hoax_hoax ORDER BY id ASC")
    row = cursor.fetchall()
    documents = []
   
    for i in row:
    	words_list = list(i) #split by any whitespaces, then return as array
    	for j in words_list:
    		kata = j.split()
    		documents.append(kata)
     
    #remove common words and tokenize
    stoplist = set(open('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/stopwords_id.txt','r').read().split('\n'))
    texts = [[word.lower() for word in text if word not in stoplist] for text in documents]

    #remove words that appear only once
    from collections import defaultdict
    frequency = defaultdict(int)
    for text in texts:
	    for token in text:
		    frequency[token] += 1

    texts = [[token for token in text if frequency[token] > 0] for text in texts]

    from pprint import pprint #pretty printer
    pprint ("document : ")
    pprint(texts)

    dictionary = corpora.Dictionary(texts)
    dictionary.save('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus.dict') #store dictionary
   # print ("\nJumlah Token dalam dictionary : ", dictionary)

#    print ("\nDaftar Token : ", dictionary.token2id)


    #mengubah dokumen baru menjadi vector
    new_doc = "Sebarkan pesan berantai ini, jika tidak maka akan berbahaya"
 #   print("\n\nquery: ", new_doc)
    new_vec = dictionary.doc2bow(new_doc.lower().split())
  #  print ("New Vector : ", new_vec )#kata "interaction" gaada di dictionary, maka kata tsb diabaikan

    corpus = [dictionary.doc2bow(text) for text in texts]
    corpora.MmCorpus.serialize('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus.mm', corpus) #store to disk
   # print ("\nCorpus : ", corpus)


def vslda():
	import logging, gensim, bz2
	logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)
	import os.path
	from gensim import corpora, models, similarities

	vs() #call fungsi vs()

	if (os.path.exists("/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus.dict")):
	    dictionary = corpora.Dictionary.load('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus.dict')
	    corpus = corpora.MmCorpus('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus.mm')
	    print("Used files generated from first tutorial\n")
	else:
	    print("Please run first tutorial to generate data set\n")

	tfidf = models.TfidfModel(corpus)
	

	#transformation to whole corpus
	corpus_tfidf = tfidf[corpus]
	#print("\ntfidf whole corpus: \n")
	#for doc in corpus_tfidf:
	#   print(doc)

	#LDA Proccess
	lda = models.LdaModel(corpus, id2word=dictionary, num_topics=2)
	corpus_lda = lda[corpus_tfidf]
	lda.print_topics()

	print("\n\n")
	i = 1
	cursor = connection.cursor()
	temp = []
	for doc in corpus_lda:
	    if doc[0][1] > doc [1][1]:
	       	print(i, " topic: ", doc[0][0], " value: ", doc[0][1])
	       	temp.append(doc[0][0])
	       	#cursor.execute("UPDATE hoax_hoax SET label = %s WHERE id IN (SELECT ID FROM hoax_hoax)" % (doc[0][0]))
	        #hoax = Hoax.objects.get(id = int(corpus_id))
	        #hoax.label = doc[0][0]
	        #hoax.save()

	    elif doc[1][1] > doc [0][1]:
	        print(i, " topic: ", doc[1][0], " value: ", doc[1][1])
	        temp.append(doc[1][0])
	        #cursor.execute("UPDATE hoax_hoax SET label = %s WHERE id IN (SELECT ID FROM hoax_hoax)" % (doc[1][0]))
	        #hoax = Hoax.objects.get(id = int(corpus_id))
	        #hoax.label = doc[1][0]
	        #hoax.save()
	    i += 1

	item = iter(temp)
	for corpus_id in Hoax.objects.raw('SELECT id FROM hoax_hoax ORDER BY id ASC'):
		if len(temp) != 0:
			i = next(item)
			print(i)
			cursor.execute("UPDATE hoax_hoax SET label = %s WHERE id = %s" % (i, corpus_id.id))
		 	

	




