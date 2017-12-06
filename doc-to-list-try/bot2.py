from telegram.ext import Updater
from telegram.ext import CommandHandler
from telegram.ext import MessageHandler, Filters
from gensim import corpora
import os
import ConfigParser

config = ConfigParser.ConfigParser()
config.read('bot.ini')
bot_token = config.get('telegram_bot', 'token')

updater = Updater(token=bot_token)

dispatcher = updater.dispatcher

import logging
logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.INFO)


def token(bot, update):
	bot.send_message(chat_id=update.message.chat_id, text=texts)


def dict(bot, update):
	bot.send_message(chat_id=update.message.chat_id, text= dictionary.token2id)
	
def start(bot, update):
	bot.send_message(chat_id=update.message.chat_id, text="Hi it's ajengbot!")

def vector(bot, update):
	print(update.message.chat_id)
	new_doc = update.message.text
	new_vec = dictionary.doc2bow(new_doc.lower().split())
	bot.send_message(chat_id=update.message.chat_id, text=new_vec)

	
def bye(bot, update):
	bot.send_message(chat_id=update.message.chat_id, text="Bye-bye!")

def help(bot, update):
	pesan = '''
	/start : say hi to the bot
	/help : to get help from the bot
	/doc : see list of documents
	/token : see list of tokens 
	/dict : see dictionary of tokens
	/vec : to check a sentence's vector space model 
	/bye : say bye to the bot	
	
	
	'''
	var = update.message.chat_id
	bot.send_message(chat_id=update.message.chat_id, text=pesan)
	
def doc(bot, update):
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
	var = update.message.chat_id
	bot.send_message(chat_id=update.message.chat_id, text=document)
		
start_handler = CommandHandler('start', start)
dispatcher.add_handler(start_handler)

doc_handler = CommandHandler('doc', doc)
dispatcher.add_handler(doc_handler)

bye_handler = CommandHandler('bye', bye)
dispatcher.add_handler(bye_handler)


def vec(bot, update):
	bot.send_message(chat_id=update.message.chat_id, text= "Enter a sentence: ")
	new_doc = update.message.text
	if new_doc is not None:
		vector_handler = MessageHandler(Filters.text, vector)
		dispatcher.add_handler(vector_handler)
	new_doc is None

vec_handler = CommandHandler('vec', vec)
dispatcher.add_handler(vec_handler)

help_handler = CommandHandler('help', help)
dispatcher.add_handler(help_handler)

dict_handler = CommandHandler('dict', dict)
dispatcher.add_handler(dict_handler)

token_handler = CommandHandler('token', token)
dispatcher.add_handler(token_handler)

'''echo_handler = MessageHandler(Filters.text, echo)
dispatcher.add_handler(echo_handler)'''

updater.start_polling()
updater.idle()
