# create member
class NewMember
  def initialize(member_name, arr)
    @member = {}
    @member[:name] = member_name
    create_cases
    arr << @member
  end

  def create_cases
    @member[:battles] = 0
    @member[:bad_words] = 0
    @member[:avr_words] = 0
    @member[:words_per_round] = 0
    @member[:rounds] = 0
  end
end
