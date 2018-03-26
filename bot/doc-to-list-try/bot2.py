from telegram.ext import Updater
from telegram.ext import MessageHandler, Filters
from telegram.ext import CommandHandler

updater = Updater(token='453800080:AAFg-uZIFrn4bzoPdQRnvX6VNG8TdBbkmQk')
dispatcher = updater.dispatcher

import logging
logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.INFO)

def start(bot, update):
	bot.send_message(chat_id=update.message.chat_id, text="I'm a bot, please talk to me!")

def addfile(bot, update):
	bot.send_message(chat_id=update.message.chat_id, text = "Enter a sentence: ")
	new_doc = update.message.text
	if new_doc is not None:
		corpus_handler = MessageHandler(Filters.text, corpus)
		dispatcher.add_handler(corpus_handler)
	new_doc is None

def corpus(bot, update):
   	print(update.message.chat_id)
	new_doc = update.message.text
	filename = "corpuz.csv"
    	f = open(filename, "a")
    	f.write(new_doc.replace(",", ";") + "\n")
	f.close()
	

start_handler = CommandHandler('start', start)
dispatcher.add_handler(start_handler)

addfile_handler = CommandHandler('add', addfile)
dispatcher.add_handler(addfile_handler)

updater.start_polling()
