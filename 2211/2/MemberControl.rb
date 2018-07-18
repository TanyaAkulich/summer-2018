# member initializer
class MemberControl
  def initialize
    @members = []
    @member_name = ''
    @member = {}
  end

  def find_members_name
    Dir.foreach('versus-battle') do |file|
      tail_for_delete = file[/\s{1}(против|vs|VS){1}\s{1}.+\z/]
      @member_name = file.chomp(tail_for_delete)
      verification_of_existence(file)
    end
  end

  def verification_of_existence(file_name)
    return @member_name if @member_name.include?('.') || @member_name.include?('..')
    initialize_member unless search_in_array(:name)
    temp = @members.index(search_in_array(:name))
    FillMembersInfo.new(@members[temp], file_name).add_info
  end

  def search_in_array(attr)
    @members.detect { |mem| mem[attr] == @member_name }
  end

  def initialize_member
    @member = {}
    @member[:name] = @member_name
    create_cases
    @members << @member
  end

  def create_cases
    @member[:battles] = 0
    @member[:bad_words] = 0
    @member[:avr_words] = 0
    @member[:words_per_round] = 0
    @member[:rounds] = 0
  end
end
