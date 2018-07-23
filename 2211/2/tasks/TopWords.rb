require_relative '../TestForExistence'
require_relative '../SortWords'
require_relative '../TestForExistence'

# 2nd task
class TopWords
  attr_reader :name, :number
  # :reek:ControlParameter
  def initialize(name, number)
    @name = name
    @number = number || 30
    @words = []
    @sorted = []
  end

  def favourite_words
    @words = TestForExistence.new(name, @words).test
    result
  end

  def result
    @sorted = SortWords.new.words_sort(@words)
    @words.empty? ? output_all_members(name) : words_number_output(number)
  end

  def words_number_output(number)
    number.to_i.times do |num|
      puts "#{@sorted[num][0]} - #{@sorted[num][1]} times"
    end
  end

  def output_all_members(name)
    puts "Рэпер #{name} не известен мне. Зато мне известны:"
    AllMembersNames.new.all_members_names
  end
end
