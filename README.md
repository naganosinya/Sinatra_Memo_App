# Sinatra_ToDo_App

## 使い方

### Set up
````
$ git clone https://github.com/naganosinya/Sinatra_Memo_App.git
$ cd ./Sinatra_Memo_App
$ bundle install
````

### DB作成
```
$ createdb sinatra_memos_db
$ psql sinatra_memos_db

sinatra_memos_db=# CREATE TABLE Memos(
  id SERIAL,
  title TEXT,
  content TEXT,
  PRIMARY KEY (id)
);
```

### サーバー起動
```
$ bundle exec ruby app.rb
```

### ブラウザで開く
```
http://localhost:4567/
```
