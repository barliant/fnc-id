from pprint import pprint

def read_words(words_file):
    table = []
    open_file = open(words_file, 'r') #read file
    contents = open_file.readlines() #read every line on file
    for line in contents: #for each line on contents 
        words_list = line.split() #split by any whitespaces, then return as array
        table.append(words_list) #append the last words_list with the current words_list as array 
    return table
    open_file.close()

pprint (read_words('text.txt'))


#other way:
# >>> with open('text.txt') as f:
#...     table_data = [ line.split() for line in f]
#... 
#>>> table_data
#   [['hello', 'there'], ["i'm", 'fine'], ['thank', 'you', 'for', 'your', 'help'], ['good', 'bye!']]

