def vs():
    from gensim import corpora
    import doctolist as doc
    #print ("\nMengubah Dokumen menjadi Vector Space Model \n")

    documents = doc.read_words('corpus.csv')
    #print(documents)
    

    #remove common words and tokenize
    stoplist = set(open('stopwords_id.txt','r').read().split('\n'))
    texts = [[word.lower() for word in text if word not in stoplist] for text in documents]

    #remove words that appear only once
    from collections import defaultdict
    frequency = defaultdict(int)
    for text in texts:
	    for token in text:
		    frequency[token] += 1

    texts = [[token for token in text if frequency[token] > 0] for text in texts]

    from pprint import pprint #pretty printer
    #print ("document : ")
    #print(texts)

    dictionary = corpora.Dictionary(texts)
    dictionary.save('/home/adhanindita/tugas-akhir/fnc-id/doc-to-list-try/corpus.dict') #store dictionary
   # print ("\nJumlah Token dalam dictionary : ", dictionary)

#    print ("\nDaftar Token : ", dictionary.token2id)


    #mengubah dokumen baru menjadi vector
    new_doc = "Sebarkan pesan berantai ini, jika tidak maka akan berbahaya"
 #   print("\n\nquery: ", new_doc)
    new_vec = dictionary.doc2bow(new_doc.lower().split())
  #  print ("New Vector : ", new_vec )#kata "interaction" gaada di dictionary, maka kata tsb diabaikan

    corpus = [dictionary.doc2bow(text) for text in texts]
    corpora.MmCorpus.serialize('/home/adhanindita/tugas-akhir/fnc-id/doc-to-list-try/corpus.mm', corpus) #store to disk
   # print ("\nCorpus : ", corpus)

