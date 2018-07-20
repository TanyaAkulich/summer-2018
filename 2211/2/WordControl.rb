require_relative 'FileReader'
require_relative 'FrequencyOfRepetitions'

# calculates the number of word repetitions
class WordControl
  def initialize
    @dictionary = [] # Array of all words
  end

  def words_analysis(file, dictionary)
    @dictionary = dictionary
    FileReader.new(file, @dictionary).fill_array
    words_array_pretty_view
    FrequencyOfRepetitions.new.words_often(@dictionary)
  end

  def words_array_pretty_view
    @dictionary.flatten!
    @dictionary.map(&:downcase!)
  end
end
