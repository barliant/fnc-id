import psycopg2
import sys
import gensim, bz2
import os.path
import numpy as np
from gensim import corpora, models, similarities
from Sastrawi.Stemmer.StemmerFactory import StemmerFactory
import logging
logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)

class Hoaxdtc(object):
	def __init__(self):
		conn_str = "host='localhost' dbname='db_hoax' user='postgres' password='root'"
		self.conn = psycopg2.connect(conn_str)
		self.cursor = self.conn.cursor()
		print('connected!')

	def read(self, q):
		cursor = self.conn.cursor()
		cursor.execute(q)
		return cursor.fetchall()

	#only tokenizing
	def token(self):
		print("Tokenizing Only")
		cursor = self.conn.cursor()
		cursor.execute("SELECT corpus FROM tbhoax2 ORDER BY id ASC")
		row = cursor.fetchall()
		documents = []
		
		for i in row:
			words_list = list(i) #split by any whitespaces, then return as array
			for j in words_list:
				kata = j.split()
				documents.append(kata)

		#tokenize
		texts = [[word.lower() for word in text] for text in documents]

		#remove words that appear only once
		from collections import defaultdict
		frequency = defaultdict(int)
		for text in texts:
			for token in text:
				frequency[token] += 1

		texts = [[token for token in text if frequency[token] > 0] for text in texts]

		dictionary = corpora.Dictionary(texts)
		#store dictionary
		dictionary.save('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus2.dict') 

		corpus = [dictionary.doc2bow(text) for text in texts]
		corpora.MmCorpus.serialize('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus2.mm', corpus) #store to disk

		dictionary = corpora.Dictionary.load('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus2.dict')
		corpus = corpora.MmCorpus('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus2.mm')


		tfidf = models.TfidfModel(corpus)
		

		#transformation to whole corpus
		corpus_tfidf = tfidf[corpus]

		#LDA Proccess
		lda = models.LdaModel(corpus, id2word=dictionary, num_topics=2)
		corpus_lda = lda[corpus_tfidf]
		lda.print_topics()

		print("\n\n")
		i = 1
		temp = []
		for doc in corpus_lda:
		    if doc[0][1] > doc [1][1]:
		       	print(i, " topic: ", doc[0][0], " value: ", doc[0][1])
		       	temp.append(doc[0][0])
		       

		    elif doc[1][1] > doc [0][1]:
		        print(i, " topic: ", doc[1][0], " value: ", doc[1][1])
		        temp.append(doc[1][0])
		       
		    i += 1

		item = iter(temp)
		cursor.execute('SELECT id FROM tbhoax2 ORDER BY id ASC')
		data = cursor.fetchall()
		for corpus_id in data:
			if len(temp) != 0:
				i = next(item)
				#print(i)
				cursor.execute("UPDATE tbhoax2 SET lbl1 = %s WHERE id = %s" % (i, corpus_id[0]))
				self.conn.commit()

	#tokenizing + stopwords removal
	def stpwrd(self):
		print("Tokenizing + Stopwords Removal")
		cursor = self.conn.cursor()
		cursor.execute("SELECT corpus FROM tbhoax2 ORDER BY id ASC")
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

		dictionary = corpora.Dictionary(texts)
		#store dictionary
		dictionary.save('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus.dict') 

		corpus = [dictionary.doc2bow(text) for text in texts]
		corpora.MmCorpus.serialize('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus.mm', corpus) #store to disk

		dictionary = corpora.Dictionary.load('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus.dict')
		corpus = corpora.MmCorpus('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus.mm')

		tfidf = models.TfidfModel(corpus)
		

		#transformation to whole corpus
		corpus_tfidf = tfidf[corpus]
		#LDA Proccess
		lda = models.LdaModel(corpus, id2word=dictionary, num_topics=2)
		corpus_lda = lda[corpus_tfidf]
		lda.print_topics()

		print("\n\n")
		i = 1
		temp = []
		for doc in corpus_lda:
		    if doc[0][1] > doc [1][1]:
		       	print(i, " topic: ", doc[0][0], " value: ", doc[0][1])
		       	temp.append(doc[0][0])
		       

		    elif doc[1][1] > doc [0][1]:
		        print(i, " topic: ", doc[1][0], " value: ", doc[1][1])
		        temp.append(doc[1][0])
		       
		    i += 1

		item = iter(temp)
		cursor.execute('SELECT id FROM tbhoax2 ORDER BY id ASC')
		data = cursor.fetchall()
		for corpus_id in data:
			if len(temp) != 0:
				i = next(item)
				#print(i)
				cursor.execute("UPDATE tbhoax2 SET lbl2 = %s WHERE id = %s" % (i, corpus_id[0]))
				self.conn.commit()

	#tokenizing + stopwords removal + stemming
	def stemg(self):
		print("Tokenizing + Stopwords Removal + Stemming")
		cursor = self.conn.cursor()
		cursor.execute("SELECT corpus FROM tbhoax2 ORDER BY id ASC")
		row = cursor.fetchall()
		
		factory = StemmerFactory()
		stemmer = factory.create_stemmer()


		documents = []
		for i in row:
			stemmed = stemmer.stem(i[0])
			words_list = stemmed.split() #split by any whitespaces, then return as array
			documents.append(words_list)

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

		dictionary = corpora.Dictionary(texts)
		#store dictionary
		dictionary.save('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus3.dict') 

		corpus = [dictionary.doc2bow(text) for text in texts]
		corpora.MmCorpus.serialize('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus3.mm', corpus) #store to disk

		dictionary = corpora.Dictionary.load('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus3.dict')
		corpus = corpora.MmCorpus('/home/adhanindita/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/lda/corpus3.mm')

		tfidf = models.TfidfModel(corpus)
		

		#transformation to whole corpus
		corpus_tfidf = tfidf[corpus]
		#LDA Proccess
		lda = models.LdaModel(corpus, id2word=dictionary, num_topics=2)
		corpus_lda = lda[corpus_tfidf]
		lda.print_topics()

		print("\n\n")
		i = 1
		temp = []
		for doc in corpus_lda:
		    if doc[0][1] > doc [1][1]:
		       	print(i, " topic: ", doc[0][0], " value: ", doc[0][1])
		       	temp.append(doc[0][0])
		       

		    elif doc[1][1] > doc [0][1]:
		        print(i, " topic: ", doc[1][0], " value: ", doc[1][1])
		        temp.append(doc[1][0])
		       
		    i += 1

		item = iter(temp)
		cursor.execute('SELECT id FROM tbhoax2 ORDER BY id ASC')
		data = cursor.fetchall()
		for corpus_id in data:
			if len(temp) != 0:
				i = next(item)
				#print(i)
				cursor.execute("UPDATE tbhoax2 SET lbl3 = %s WHERE id = %s" % (i, corpus_id[0]))
				self.conn.commit()

	
if __name__ == "__main__":
	db = Hoaxdtc()
	db.token()
	db.stpwrd()
	db.stemg()