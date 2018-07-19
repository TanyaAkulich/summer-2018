require_relative 'FindBadWords'
require_relative 'FileReader'
require_relative 'WordsNumber'

# Added info about existed member
class FillMembersInfo
  def initialize(member, file)
    @member = member
    @file = file
  end

  def add_info
    @member[:battles] += 1
    @member[:rounds] += 1
    FindBadWords.new(@member, @file)
    words_number_in_battles_and_rounds([])
  end

  def words_number_in_battles_and_rounds(word_per_battle)
    Dir.chdir('..')
    FileReader.new(@file, word_per_battle)
    WordsNumber.new(@member).words_number_in_battle(word_per_battle)
    WordsNumber.new(@member).words_number_in_rounds(word_per_battle)
  end
end
