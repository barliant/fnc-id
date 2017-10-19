from pprint import pprint
import requests
import json
from time import sleep
#from tele_news import *
#from tele_saavn import *
#from tele_cricket import *
import tele_vec as vec

token = '453800080:AAFg-uZIFrn4bzoPdQRnvX6VNG8TdBbkmQk'
url = 'https://api.telegram.org/bot{}/'.format(token)


def getme():
	res=requests.get(url+"getme")
	d = res.json()
	username = d['result']['username']


def get_updates(offset = None):
	while True:
		try:
			URL = url + 'getUpdates'
			if offset:
				URL += '?offset={}'.format(offset) 

			res = requests.get(URL)
			while (res.status_code !=200 or len(res.json()['result'])== 0):
				sleep(1)
				res = requests.get(URL)
			print(res.url)
			return res.json()
		
		except:
			pass;
	
def get_last(data):
	
	results = data['result']
	count = len(results)
	last = count -1
	last_update = results[last]
	return last_update


def get_last_id_text(updates):
	last_update = get_last(updates)
	chat_id =last_update['message']['chat']['id']
	update_id = last_update['update_id']
	try:
		text = last_update['message']['text']
	except:
		text = ''
	return chat_id,text,update_id


def send_message(chat_id,text,reply_markup=None):
	#untuk ngirim pesan dan menunya 
	URL = url + "sendMessage?text={}&chat_id={}&parse_mode=Markdown".format(text,chat_id)
	if reply_markup:
		URL += '&reply_markup={}'.format(reply_markup)
	res = requests.get(URL)
	while res.status_code !=200:
		res = requests.get(URL)
	print(res.status_code)


def reply_markup_maker(data):
	#untuk  bikin menunya yg dibawah
	keyboard = []
	for i in range(0,len(data),2):
		key =[]
		key.append(data[i].title())
		try:
			key.append(data[i+1].title())
		except:
			pass
		keyboard.append(key)

	reply_markup = {"keyboard":keyboard, "one_time_keyboard": True}
	return json.dumps(reply_markup)

def doc(chat_id,update_id):
	doc = vec.docs()
	send_message(chat_id,text=doc)
	

def token(chat_id,update_id):
	text = vec.tokens()
	send_message(chat_id,text)

def dict(chat_id,update_id):
	text = vec.dicts()
	send_message(chat_id,text)
	
#masih error
def vector(chat_id,update_id):
	msg = 'Enter a sentence:'
	send_message(chat_id,msg)
	chat_id,text,update_id= get_last_id_text(get_updates(update_id+1))
	text = update_id.message.text
	if new_doc is not None:
		vector = vec.vectors(text)
		send_message(chat_id,vector)
	

'''def news(chat_id,update_id):

	message = 'Select'
	commands =['Short News','Long News']
	reply_markup = reply_markup_maker(commands)
	send_message(chat_id,message,reply_markup)
	chat_id,text,update_id= get_last_id_text(get_updates(update_id+1))	

	while text.lower() == 'news':
		chat_id,text,update_id= get_last_id_text(get_updates(update_id+1))	
		sleep(0.5)
	print(text)

	if text.lower() == 'short news':
		message= ''
		news = short_news()
		for i,n in enumerate(news,1):
			message += str(i) + ". " + n.text + '\n\n'
		send_message(chat_id,message)

	elif text.lower() == 'long news':
		message= ''
		news = long_news()
		for i,n in enumerate(news[:10],1):
			message += str(i) + ". " + n.text + '\n\n'
		send_message(chat_id,message)


def saavn(chat_id,update_id):
	message = 'Select'
	commands =['Saavn Weekly Top','Hindi Chartbusters','English Chartbusters']
	reply_markup = reply_markup_maker(commands)
	send_message(chat_id,message,reply_markup)
	chat_id,text,update_id= get_last_id_text(get_updates(update_id+1))	
	
	while text.lower() == 'saavn':
		chat_id,text,update_id= get_last_id_text(get_updates(update_id+1))	
		sleep(0.5)
		
	print(text)

	if text =='Saavn Weekly Top':
		message = ''

		commands =['Hindi','English']
		message = 'Select Language'
		reply_markup = reply_markup_maker(commands)
		send_message(chat_id,message,reply_markup)

		while text == 'Saavn Weekly Top':
			chat_id,text,update_id= get_last_id_text(get_updates(update_id+1))	
			sleep(0.5)

		print(text)
		
		lang = text.lower()
		songs = saavn_tops(lang)
		for i,item in enumerate(songs,1):
			song = item.split('(')
			text = song[0]
			if len(song)==2 and len(text + song[1])<30:
				text += '('+song[1]
				
			message+= str(i)+". "+text +'\n\n'
		send_message(chat_id,message)


	elif text =='Hindi Chartbusters':
		message = ''
		songs = hindi_chartbusters()
		for i,item in enumerate(songs,1):
			song = item.split('(')
			text = song[0]
			if len(song)==2 and len(text + song[1])<30:
				text += '('+song[1]
			message+= str(i)+". "+text +'\n\n'
		send_message(chat_id,message)
			

	elif text =='English Chartbusters':
		message = ''
		songs = english_chartbusters()
		for i,item in enumerate(songs,1):
			song = item.split('(')
			text = song[0]
			if len(song)==2 and len(text + song[1])<30:
				text += '('+song[1]
			
			message+= str(i)+". "+text +'\n\n'
		send_message(chat_id,message)
			

def cricket(chat_id,update_id):
	message = 'Select'
	commands = all_matches()
	reply_markup = reply_markup_maker(commands)
	send_message(chat_id,message,reply_markup)
	chat_id,desc,update_id= get_last_id_text(get_updates(update_id+1))
	print(desc)

	commands =['Score','Full Scorecard','Commentary']
	reply_markup = reply_markup_maker(commands)
	send_message(chat_id,message,reply_markup)
	chat_id,text,update_id= get_last_id_text(get_updates(update_id+1))	
	print(text)	

	if text.lower()=='score':
		text = live_score(desc)
		send_message(chat_id,text)

	elif text.lower() == 'full scorecard':
		text = scorecard(desc)
		print(text)
		send_message(chat_id,text)

	elif text.lower() == 'commentary':
		text = commentary(desc)
		send_message(chat_id,text)'''


def welcome_note(chat_id, commands):
	text = "Bot Welcomes You"
	send_message(chat_id,text)
	text = 'Select'
	reply_markup = reply_markup_maker(commands)
	send_message(chat_id,text,reply_markup)


def start(chat_id):
	message = 'Wanna Start'	
	reply_markup = reply_markup_maker(['Start'])
	send_message(chat_id,message,reply_markup)
	
	chat_id,text,update_id= get_last_id_text(get_updates())	
	while(text.lower() != 'start'):
		chat_id,text,update_id= get_last_id_text(get_updates(update_id+1))	
		sleep(0.5)

	return chat_id,text,update_id


def end(chat_id,text,update_id):
	message = 'Do you wanna end?'
	reply_markup = reply_markup_maker(['Yes','No'])
	send_message(chat_id,message,reply_markup)
	
	new_text =text
	while(text == new_text):
		chat_id,new_text,update_id= get_last_id_text(get_updates(update_id+1))	
		sleep(1)

	if new_text =='Yes':
		return 'y'
	else:
		return 'n'


def menu(chat_id,text,update_id):

	commands = ['documents','token','dictionary', 'vectorspace']
	welcome_note(chat_id, commands)
	
	while( text.lower() =='start'):
		chat_id,text,update_id= get_last_id_text(get_updates(update_id+1))	
		sleep(0.5)
	print(text)
	while text.lower() not in commands:
		chat_id,text,update_id= get_last_id_text(get_updates(update_id+1))	
		sleep(0.5)

	if text.lower()=='documents':
		doc(chat_id,update_id)

	elif text.lower()=='token':
		token(chat_id,update_id)

	elif text.lower()=='dictionary':
		dict(chat_id,update_id)
	
	elif text.lower()=='vectorspace':
		vector(chat_id,update_id)


def main():
	text= ''
	chat_id,text,update_id= get_last_id_text(get_updates())	
	chat_id, text,update_id = start(chat_id)
	print('Started')
	
	while text.lower() != 'y':
		sleep(1)
		text = 'start'
		menu(chat_id,text,update_id)
		text ='y'
	
		chat_id,text,update_id= get_last_id_text(get_updates())	
		text = end(chat_id,text,update_id)
	

if __name__ == '__main__':
	main()
