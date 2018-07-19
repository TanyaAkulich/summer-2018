require_relative '../MemberControl'
require_relative '../PrintMembersDescription'
require_relative '../ResultSorter'

# 1st task
class TopBadWords
  attr_reader :number
  def initialize
    @members = []
  end

  def foul_language(number)
    @number = number
    MemberControl.new(@members).find_members_name
    ResultSorter.new(@members, :bad_words).sort_result
    puts_top
  end

  def puts_top
    number.times do |num|
      PrintMembersDescription.new(@members[num]).puts_line
      puts
    end
  end
end
