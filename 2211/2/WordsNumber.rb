# calculates the number of words per battle and per round
class WordsNumber
  attr_reader :number
  def initialize(member, words_array)
    @member = member
    @number = words_array.size
  end

  def words_number_in_battle
    calculates(@member[:avr_words], @member[:battles])
  end

  def words_number_in_rounds
    calculates(@member[:words_per_round], @member[:rounds])
  end

  def calculates(value, range)
    value.zero? ? value_is_zero? : (number / range + value) / 2.0
  end

  def value_is_zero?
    number / @member[:battles]
  end
end
