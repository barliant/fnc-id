from urllib2 import urlopen as uReq
from bs4 import BeautifulSoup as soup

my_url = 'https://data.turnbackhoax.id/#/result/web/%40terpopuler'

#opening up connection, grabbing the page
uClient = uReq(my_url)
page_html = uClient.read()
uClient.close()

#html parsing
page_soup = soup(page_html, "html.parser")

#grabs each product
containers = page_soup.findAll("div",{"class":"thumbnail feed-item"})

filename = "hoaxes.csv"
f = open(filename, "w")

headers = "title, link"

f.write(headers)

for container in containers:
	
	title_container = container.findAll("a",{"class":"ng-binding"})
	title = title_container[0].text
	
	link_container = container.findAll("a",{"class":"feed-item__link ng-binding"})
	link = link_container[0].text
	
	print("title: " + title)
	print("link: " + link)
	
	f.write(brand + "," + title.replace(",", "|") + "," + link + "\n")
	
f.close()
