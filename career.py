import nltk
from nltk.tokenize import word_tokenize
from nltk.tokenize import sent_tokenize
from nltk.tag import pos_tag

response = input("Hi, Please introduce yourself: ")
sentences = sent_tokenize(response)
token_sentences = [word_tokenize(sentence) for sentence in sentences]
tag_sentences = [pos_tag(sentence) for sentence in token_sentences]
name=''
for sentence in tag_sentences:
    for chunk in nltk.ne_chunk(sentence):
        if type(chunk)==nltk.tree.Tree and chunk.label()=='PERSON':
            name = chunk[0][0]
            break

f = open('C:/Users/Admin/Desktop/Sem1/AI/Assignment4_graded/facts.txt', 'w')
if name == '':
    f.write('name_person(user).')
else:
    f.write('name_person('+name.lower()+').')
f.close()
