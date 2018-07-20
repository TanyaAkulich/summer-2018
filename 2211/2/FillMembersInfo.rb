require_relative 'FindBadWords'
require_relative 'FileReader'
require_relative 'WordsNumber'
require_relative 'RoundsCounter'

# Added info about existed member
class FillMembersInfo
  def initialize(member, file)
    @member = member
    @file = file
  end

  def add_info
    @member[:battles] += 1
    # @member[:rounds] += 1
    RoundsCounter.new(@member, @file).file_read
    FindBadWords.new(@member, @file)
    words_number_in_battles_and_rounds([])
  end

  def words_number_in_battles_and_rounds(word_per_battle)
    Dir.chdir('..')
    FileReader.new(@file, word_per_battle).fill_array
    @member[:avr_words] = WordsNumber.new(@member, word_per_battle).words_number_in_battle
    @member[:words_per_round] = WordsNumber.new(@member, word_per_battle).words_number_in_rounds
  end
end
