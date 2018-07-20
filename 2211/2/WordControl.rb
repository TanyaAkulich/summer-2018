require_relative 'FileReader'

# calculates the number of word repetitions
class WordControl
  def initialize(name, number)
    @words = [] # Array og hashes (word is a key, value - number of repetitions)
    @dictionary = [] # Array of all words
    @name = name
    @number = number
    @number = 30 unless number
  end

  def word_analysis(file, dictionary)
    @dictionary = dictionary
    FileReader.new(file, @dictionary).fill_array
    words_array_pretty_view
    words_often
  end

  def words_array_pretty_view
    @dictionary.flatten!
    @dictionary.map(&:downcase!)
  end

  def words_often
    @dictionary.each do |word|
      new_word(word) unless search_in_words_array(word)
      temp = @words.index(search_in_words_array(word))
      @words[temp][word.to_sym] += 1
    end
  end

  def new_word(word)
    new_word = {}
    new_word[word.to_sym] = 0
    @words << new_word
  end

  def search_in_words_array(word)
    @words.detect { |mem| mem[word.to_sym] }
  end
end
