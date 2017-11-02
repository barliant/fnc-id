def read_words(words_file):
    open_file = open(words_file, 'r')
    words_list = []
    doc_list = []
    contents = open_file.readlines()
    for i in range(len(contents)):
        words_list.extend(contents[i].split())
    return words_list
    open_file.close()

print (read_words('text.txt'))

