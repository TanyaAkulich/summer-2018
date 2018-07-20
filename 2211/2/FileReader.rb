# Make dictionary
class FileReader
  def initialize(file, words_array)
    @file = file
    @words_from_file = words_array
  end

  def fill_array
    Dir.chdir('versus-battle')
    IO.foreach(@file) do |line|
      @words_from_file << line.scan(/[А-яёA-z\d]+[^\s,\.\-\?\!]*/i)
    end
    Dir.chdir('..')
    @words_from_file.flatten!
  end
end
