require_relative 'WordControl'

# check if exist
class TestForExistence
  def initialize(name, words)
    @name = name
    @words = words
  end

  def test
    Dir.foreach('versus-battle') do |file|
      for_delete = file[/\s{1}(против|vs|VS){1}\s{1}.+\z/]
      member_name = file.chomp(for_delete)
      @words = WordControl.new.words_analysis(file, []) if @name == member_name[1..-1]
    end
    @words
  end
end
