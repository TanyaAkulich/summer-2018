require_relative 'NewMember'
require_relative 'FillMembersInfo'

# member initializer
class MemberControl
  attr_reader :members
  def initialize(array)
    @members = array
    @member_name = ''
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
    NewMember.new(@member_name, members).create_new_member_case
    index = find_index
    FillMembersInfo.new(members[index], file_name).add_info
  end

  def find_index
    members.index(search_in_array(:name))
  end

  def search_in_array(attr)
    members.detect { |mem| mem[attr] == @member_name }
  end
end
