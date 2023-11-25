from flask import Flask, request, jsonify, render_template
import re
from konlpy.tag import Okt
from sklearn.feature_extraction.text import TfidfVectorizer
import numpy as np



okt = Okt()
stopwords = ['했습니다', '면서', '그리고', '하지만', '이다', '또', '있는', '있다', '했다', '자', '이'] # 여기에 불용어를 추가하면 됩니다.

def tokenize(text):
   tokens = okt.pos(text)
   return [word for word, pos in tokens if pos != 'Josa' and word not in stopwords and len(word) > 1] # 불용어 제거 추가

   
def Topic_Modeling(text):
    
    # 줄바꿈과 공백 제거
   text = text.replace('\n', ' ').replace(' ', '')

    # 구두점 제거 (추가된 부분)
   text = re.sub(r'[^\w\s]', '', text)

    # TF-IDF 벡터화
   vectorizer = TfidfVectorizer(tokenizer=tokenize, min_df=0.01, max_df=1.0)
   tfidf_matrix = vectorizer.fit_transform([text])

    # TF-IDF 값이 가장 높은 단어 5개를 찾는다
   indices = np.argsort(tfidf_matrix.toarray()).flatten()[::-1]
   features = vectorizer.get_feature_names_out()
   top_features = [features[i] for i in indices[:8]]
   print(f"토픽 8개: {top_features}")
   
   return top_features

app = Flask(__name__)

@app.route('/')
def home():
   with open('kodata.txt', 'r', encoding='utf-8') as f:
      text = f.read()
      
   topics = Topic_Modeling(text)
   
   return render_template('index.html', topics=topics)

# @app.route('/topic', methods=['POST'])
# def get_topic():
#        data = request.get_json()
#        text= data['text']
       
#        topics =Topic_Modeling(text)
       
#        return jsonify({'topics': topics})

if __name__ == '__main__':  
   app.run('0.0.0.0',port=5000,debug=True)
   