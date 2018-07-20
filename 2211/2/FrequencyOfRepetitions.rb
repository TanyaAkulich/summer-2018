# calculate Frequency Of Repetitions
class FrequencyOfRepetitions
  def initialize
    @words = [] # Array og hashes (word is a key, value - number of repetitions)
  end

  def words_often(all_words_array)
    all_words_array.each do |word|
      new_word(word) unless search_in_words_array(word)
      temp = find_index_of_word(word)
      @words[temp][word.to_sym] += 1
    end
    @words
  end

  def new_word(word)
    new_word = {}
    new_word[word.to_sym] = 0
    @words << new_word
  end

  def find_index_of_word(word)
    @words.index(search_in_words_array(word))
  end

  def search_in_words_array(word)
    @words.detect { |mem| mem[word.to_sym] }
  end
end
