from urllib2 import urlopen as uReq
from bs4 import BeautifulSoup as soup

my_url = 'https://news.detik.com/'

#opening up connection, grabbing the page
uClient = uReq(my_url)
page_html = uClient.read()
uClient.close()

#html parsing
page_soup = soup(page_html, "html.parser")

#grabs each product
containers = page_soup.findAll("div",{"class":"desc_nhl"})

filename = "corpusdetik.csv"
f = open(filename, "w")

headers = "title, link, date"

f.write(headers)

for container in containers:
	
	title_container = container.findAll("a",{"data-label":"List Berita"})
	title = title_container[0].text

	link = container.a["href"]

	
	date_container = container.findAll("span",{"class":"labdate f11"})
	date = date_container[0].text
	
	print("title: " + title)
	print("link: " + link)
	print("date: " + date)
	
	f.write("\n" + title.replace(",", "|") + "," + link + "," + date.replace(",", "|") )
	
f.close()
