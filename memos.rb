# frozen_string_literal: true

require 'json'

class Memos
  MEMOS_PATH = 'db/memos.json'

  def all
    hash = set_memos
    hash['memos']
  end

  def find(id)
    hash = set_memos
    hash['memos'].find { |i| i['id'] == id }
  end

  def create(title, content)
    hash = set_memos

    next_id = hash['memos'].map { |memo| memo['id'] }.max.to_i + 1
    hash['memos'].append({ 'id': next_id.to_s, 'title': title, 'content': content })

    File.open(MEMOS_PATH, 'w') do |file|
      JSON.dump(hash, file)
    end
  end

  def update(id, title, content)
    hash = set_memos

    memo = hash['memos'].find { |i| i['id'] == id }
    if memo
      memo['title'] = title
      memo['content'] = content
    end

    File.open(MEMOS_PATH, 'w') do |file|
      JSON.dump(hash, file)
    end
  end

  def destroy(id)
    hash = set_memos
    memo = hash['memos'].find { |i| i['id'] == id }
    hash['memos'].delete(memo) if memo['id'] == id

    File.open(MEMOS_PATH, 'w') do |file|
      JSON.dump(hash, file)
    end
  end

  private

  def set_memos
    File.open(MEMOS_PATH) do |f|
      JSON.parse(f.read)
    end
  end
end
