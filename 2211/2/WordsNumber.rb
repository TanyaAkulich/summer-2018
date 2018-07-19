# calculates the number of words per battle and per round
class WordsNumber
  attr_reader :number
  def initialize(member)
    @member = member
  end

  def words_number_in_battle(words_array)
    number = words_array.size
    @member[:avr_words] = number / @member[:battles] if @member[:avr_words].zero?
    @member[:avr_words] = (number / @member[:battles] + @member[:avr_words]) / 2.0 unless @member[:avr_words].zero?
  end

  # rubocop: disable Metrics/LineLength
  def words_number_in_rounds(words_array)
    number = words_array.size
    return @member[:words_per_round] = number / @member[:rounds] if @member[:words_per_round].zero?
    return @member[:words_per_round] = (number / @member[:rounds] + @member[:words_per_round]) / 2.0 unless @member[:words_per_round].zero?
  end
  # rubocop: enable Metrics/LineLength
end
