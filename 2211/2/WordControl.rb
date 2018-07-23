require_relative 'FileReader'
require_relative 'FrequencyOfRepetitions'

# calculates the number of word repetitions
class WordControl
  attr_reader :dictionary
  attr_reader :file
  def initialize
    @dictionary = [] # Array of all words
  end

  def words_analysis(file_name, dict)
    @dictionary = dict
    @file = file_name
    FileReader.new(file, dictionary).fill_array
    words_array_pretty_view
    FrequencyOfRepetitions.new.words_often(dictionary)
  end

  def words_array_pretty_view
    dictionary.flatten!
    dictionary.map(&:downcase!)
  end
end
