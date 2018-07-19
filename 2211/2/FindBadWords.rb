require 'russian_obscenity/base'

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
