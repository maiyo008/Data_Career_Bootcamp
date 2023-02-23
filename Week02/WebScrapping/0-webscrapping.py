# Importing beautiful soup module
from bs4 import BeautifulSoup

# Read home.html file from the local machine. It is stored in the same folder as this file
with open('index.html', 'r') as home_html:
    content = home_html.read()
    
    # Parsing the html file to a Python object
    soup = BeautifulSoup(content, 'lxml')
    # Extract courses cards from the html file.
    course_cards = soup.find_all('div', class_='card')
    for course in course_cards:
        course_name = course.h5.text
        course_price = course.a.text.split()[-1]
        print(f'{course_name} costs {course_price}')
    


