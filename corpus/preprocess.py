filehoax = open('all_hoax.txt').read()
hoaxlow = filehoax.lower()
open('all_hoax_low.txt', 'w').write(hoaxlow)

import re
string = open('all_hoax_low.txt').read()
new_str = re.sub('[^a-zA-Z\n]', ' ', string)
open('all_hoax_nosym.txt', 'w').write(new_str)

#removing stopwords

f1 = open('all_hoax_nosym.txt', 'r')
f2 = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/stopwords_id.txt', 'r')
f3 = open("all_hoax_stprmvd.txt","w")
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

#facts
filefacts = open('all_facts.txt').read()
factslow = filefacts.lower()
open('all_facts_low.txt', 'w').write(factslow)

stringf = open('all_facts_low.txt').read()
new_strf = re.sub('[^a-zA-Z\n]', ' ', stringf)
open('all_facts_nosym.txt', 'w').write(new_strf)

#removing stopwords

f1f = open('all_facts_nosym.txt', 'r')
f2f = open('D:/tugas-akhir/fnc-id/django_project/hoaxdetector/hoax/static/stopwords_id.txt', 'r')
f3f = open("all_facts_stprmvd.txt","w")
first_wordsf=[]
second_wordsf=[]
for line in f1f:
    words = line.split()
    for w in words:
        first_wordsf.append(w)

for line in f2f:
    w = line.split()
    for i in w:
        second_wordsf.append(i)


for word1 in first_wordsf :
    for word2 in second_wordsf:
        if word1 == word2:
            while True:
                try:
                    first_wordsf.remove(word2)
                except:
                    break
            

for word in first_wordsf:
    f3f.write(word)
    f3f.write(' ')

f1f.close()
f2f.close()
f3f.close()


from Sastrawi.Stemmer.StemmerFactory import StemmerFactory
factory = StemmerFactory()
stemmer = factory.create_stemmer()

#stemming only
h_stem = open('all_hoax_nosym.txt').read()
h_stemmed = stemmer.stem(hoax)
open('all_hoax_stemmed.txt', 'w').write(hoax_stemmed)

f_stem = open('all_facts_nosym.txt').read()
f_stemmed = stemmer.stem(fact)
open('all_facts_stemmed.txt', 'w').write(fact_stemmed)

#stprmvd + stem
hoaxstp = open('all_hoax_stprmvd.txt').read()
hoax_stemmed = stemmer.stem(hoax)
open('all_hoax_stemmedstprmvd.txt', 'w').write(hoax_stemmed)

factstp = open('all_facts_stprmvd.txt').read()
fact_stemmed = stemmer.stem(fact)
open('all_facts_stemmedstprmvd.txt', 'w').write(fact_stemmed)