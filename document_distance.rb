class Document
  attr_reader :words, :count

  def initialize(document)
    @words = document.scan(/\w+/)
    @count = count_words
  end

  def count_words
    @words.each_with_object(Hash.new(0)) { |w, hash| hash[w] += 1 }
  end

  def each
    @count.each { |k, v| yield k, v }
  end

  def fetch(key)
    @count.fetch(key, 0)
  end

  def self.distance(doc1, doc2)
    total = 0

    doc1.each do |word, count|
      total += count * doc2.fetch(word)
    end

    total
  end
end
