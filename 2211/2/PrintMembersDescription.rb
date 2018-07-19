# Print member's description
class PrintMembersDescription
  def initialize(member)
    @member = member
  end

  def puts_line
    printf('%-25s ', @member[:name])
    printf('| %-2d battles ', @member[:battles])
    printf('| %-4d  total bad words ', @member[:bad_words])
    printf('| %-3.2f  bad words per battle ', @member[:avr_words])
    printf('| %-4d  words per round', @member[:words_per_round])
  end
end
