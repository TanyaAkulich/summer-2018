# create member
class NewMember
  attr_reader :member
  def initialize(member_name, arr)
    @member = {}
    member[:name] = member_name
    @arr = arr
  end

  def create_new_member_case
    create_cases
    add_new_member
  end

  def add_new_member
    @arr << member # create_cases
  end

  def create_cases
    member[:battles] = 0
    member[:bad_words] = 0
    member[:avr_words] = 0
    member[:words_per_round] = 0
    member[:rounds] = 0
  end
end
