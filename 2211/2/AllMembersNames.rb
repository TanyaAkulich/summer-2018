#  Puts All battlers
class AllMembersNames
  attr_reader :file
  def all_members_names
    Dir.foreach('versus-battle') do |file|
      @file = file
      highlight_name
    end
  end

  def highlight_name
    for_delete = file[/\s{1}(против|vs|VS){1}\s{1}.+\z/]
    puts file.chomp(for_delete) unless file.include?('.') || file.include?('..')
  end
end
