class Hamming
  def self.compute(word1, word2)
    word1.size.times.count { |i| word1[i] != word2[i] }
  end
end

