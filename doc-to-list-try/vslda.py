import logging, gensim, bz2
logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)
import os.path
from gensim import corpora, models, similarities
if (os.path.exists("/home/adhanindita/tugas-akhir/fnc-id/doc-to-list-try/test.dict")):
    dictionary = corpora.Dictionary.load('/home/adhanindita/tugas-akhir/fnc-id/doc-to-list-try/test.dict')
    corpus = corpora.MmCorpus('/home/adhanindita/tugas-akhir/fnc-id/doc-to-list-try/test.mm')
    print("Used files generated from first tutorial\n")
else:
    print("Please run first tutorial to generate data set\n")

tfidf = models.TfidfModel(corpus)
new_doc = "Human computer interaction"
print("\nquery: ", new_doc)
query = dictionary.doc2bow(new_doc.lower().split())
print("\ntfidf : ", tfidf[query], "\n\n")

#transformation to whole corpus
corpus_tfidf = tfidf[corpus]
#print("\ntfidf whole corpus: \n")
#for doc in corpus_tfidf:
 #   print(doc)

#LDA Proccess
lda = models.LdaModel(corpus, id2word=dictionary, num_topics=4)
corpus_lda = lda[corpus_tfidf]
lda.print_topics(4)

print("\n\n")
for doc in corpus_lda:
    print(doc)



