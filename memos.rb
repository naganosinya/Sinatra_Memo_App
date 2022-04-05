# frozen_string_literal: true

require 'pg'

class Memos
  DB_NAME = 'sinatra_memos_db'

  def all
    connection = set_connection
    connection.exec("SELECT * FROM Memos")
  end

  def find(id)
    connection = set_connection
    connection.exec('SELECT * FROM Memos WHERE id = $1', [id])
  end

  def create(title, content)
    connection = set_connection
    connection.exec('INSERT INTO Memos (title, content) VALUES ($1, $2)', [title, content])
  end

  def update(title, content, id)
    connection = set_connection
    connection.exec('UPDATE Memos SET title = $1, content = $2 WHERE id = $3', [title, content, id])
  end

  def destroy(id)
    connection = set_connection
    connection.exec('DELETE FROM Memos WHERE id = $1', [id])
  end

  private

  def set_connection
    PG::connect(dbname: "#{DB_NAME}")
  end
end
