from gensim import corpora


documents= ["Human machine interface for lab abc computer applications",
              "A survey of user opinion of computer system response time",
              "The EPS user interface management system",
              "System and human system engineering testing of EPS",
              "Relation of user perceived response time to error measurement",
              "The generation of random binary unordered trees",
              "The intersection graph of paths in trees",
              "Graph minors IV Widths of trees and well quasi ordering",
              "Graph minors A survey"]

#remove common words and tokenize
stoplist = set('for a of the and to in'.split())
texts = [[word for word in document.lower().split() if word not in stoplist] for document in documents]

#remove words that appear only once
from collections import defaultdict
frequency = defaultdict(int)
for text in texts:
	for token in text:
		frequency[token] += 1

texts = [[token for token in text if frequency[token] > 1] for text in texts]

dictionary = corpora.Dictionary(texts)
dictionary.save('/tugas-akhir/fnc-id/test.dict') #store dictionary

corpus = [dictionary.doc2bow(text) for text in texts]
corpora.MmCorpus.serialize('/tugas-akhir/fnc-id/test.mm', corpus)

def docs():
	document = '''
	1 : "Human machine interface for lab abc computer applications"
	2 : "A survey of user opinion of computer system response time"
	3 : "The EPS user interface management system"
	4 : "System and human system engineering testing of EPS"
	5 : "Relation of user perceived response time to error measurement"
	6 : "The generation of random binary unordered trees"
	7 : "The intersection graph of paths in trees"
	8 : "Graph minors IV Widths of trees and well quasi ordering"
	9 : "Graph minors A survey"
	'''
	return document

def tokens():
	text = texts
	return text

def dicts():
	text= dictionary.token2id
	return text
	
def vectors(text):
	new_vec = dictionary.doc2bow(text.lower().split())
	return new_vec