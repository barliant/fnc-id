import logging, gensim, bz2
logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)
import os.path
import vs as vec
from gensim import corpora, models, similarities

vec.vs()

if (os.path.exists("/home/adhanindita/tugas-akhir/fnc-id/doc-to-list-try/corpus.dict")):
    dictionary = corpora.Dictionary.load('/home/adhanindita/tugas-akhir/fnc-id/doc-to-list-try/corpus.dict')
    corpus = corpora.MmCorpus('/home/adhanindita/tugas-akhir/fnc-id/doc-to-list-try/corpus.mm')
    print("Used files generated from first tutorial\n")
else:
    print("Please run first tutorial to generate data set\n")

tfidf = models.TfidfModel(corpus)
new_doc = "Sebarkan pesan berantai ini, jika tidak maka nyawa anda akan terancam"
print("\nquery: ", new_doc)
query = dictionary.doc2bow(new_doc.lower().split())
print("\ntfidf : ", tfidf[query], "\n\n")

#transformation to whole corpus
corpus_tfidf = tfidf[corpus]
print("\ntfidf whole corpus: \n")
for doc in corpus_tfidf:
   print(doc)

#LDA Proccess
lda = models.LdaModel(corpus, id2word=dictionary, num_topics=2)
corpus_lda = lda[corpus_tfidf]
lda.print_topics(2)

print("\n\n")
i = 1
for doc in corpus_lda:
    if doc[0][1] > doc [1][1]:
        print(i, " topic: ", doc[0][0], " value: ", doc[0][1])
    elif doc[1][1] > doc [0][1]:
        print(i, " topic: ", doc[1][0], " value: ", doc[1][1])
    i += 1



