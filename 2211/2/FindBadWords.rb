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
      find_bad_words_with_russian_obscenity_gem(line)
      @word[:bad_words] += 1 if /[\*]/ =~ line
    end
  end

  def find_bad_words_with_russian_obscenity_gem(line)
    temp = RussianObscenity.find(line)
    @word[:bad_words] += temp.size
  end
end
