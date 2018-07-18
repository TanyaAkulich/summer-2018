require 'russian_obscenity/base'
require_relative '../MemberControl'
require_relative '../WordsNumber'

# 1st task
class TopBadWords < MemberControl
  attr_reader :members
  attr_reader :number
  def initialize
    super
  end

  def foul_language(number)
    @number = number
    find_members_name # method in class MemberControl///////
    ResultSorter.new(members, :bad_words)
    result
  end

  def result
    number.to_i.times do |num|
      out = Output.new
      out.first_result_output(members[num])
      puts
    end
  end
end

# Added info about existed member
class FillMembersInfo < WordsNumber
  attr_reader :file
  attr_reader :member
  def initialize(member, file)
    super
  end

  def add_info
    member[:battles] += 1
    member[:rounds] += 1
    FindBadWords.new(member, file)
    battle_analysis([])
  end

  def battle_analysis(word_per_battle)
    Dir.chdir('..')
    ArrayFiller.new(file, word_per_battle)
    word_per_battle.flatten!
    words_number_in_battle(word_per_battle)
    words_number_in_rounds(word_per_battle)
  end
end

# Find Bad words for this member
class FindBadWords
  def initialize(name, file)
    @word = name
    find(file)
  end

  def find(file)
    Dir.chdir('versus-battle')
    IO.foreach(file) do |line|
      temp = RussianObscenity.find(line)
      @word[:bad_words] += temp.size
      @word[:bad_words] += 1 if /[\*]/ =~ line
    end
  end
end

# Sort result array
class ResultSorter
  def initialize(arr, attr)
    @words = arr
    sort_result(attr)
  end

  def sort_result(attr)
    @words.sort_by! { |key| key[attr] * -1 }
  end
end
