from gensim import corpora

print "\nMengubah Dokumen menjadi Vector Space Model \n"

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

texts = [[token for token in text if frequency[token] > 0] for text in texts]

from pprint import pprint #pretty printer
print "document : "
print(texts)

dictionary = corpora.Dictionary(texts)
dictionary.save('/tugas-akhir/fnc-id/test.dict') #store dictionary
print "\nJumlah Token dalam dictionary : ", dictionary

print "\nDaftar Token : ", dictionary.token2id


#mengubah dokumen baru menjadi vector
new_doc = "Human computer interaction"
new_vec = dictionary.doc2bow(new_doc.lower().split())
print "\nNew Vector : ", new_vec #kata "interaction" gaada di dictionary, maka kata tsb diabaikan

corpus = [dictionary.doc2bow(text) for text in texts]
corpora.MmCorpus.serialize('/tugas-akhir/fnc-id/test.mm', corpus) #store to disk
print "\nCorpus : ", corpus

