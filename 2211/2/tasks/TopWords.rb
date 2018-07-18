require_relative '../WordControl'

# 2nd task
class TopWords < WordControl
  attr_reader :words
  attr_reader :name
  attr_reader :number
  def initialize
    super
    @sorted = []
  end

  def favourite_words(name, number = 30)
    @name = name
    @number = number
    member_exist
    result
  end

  def result
    words_sort
    call = WordsNumberOutput.new(number, @sorted)
    call.words_number_output unless words.empty?
    out = Output.new
    out.output_all_members(name) if words.empty?
  end

  def words_sort
    words.each { |elem| @sorted << elem.to_a }
    @sorted.flatten!(1)
    @sorted.sort! { |first, second| (first[1] <=> second[1]) * -1 }
  end

  def member_exist
    Dir.foreach('versus-battle') do |file|
      for_delete = file[/\s{1}(против|vs|VS){1}\s{1}.+\z/]
      member_name = file.chomp(for_delete)
      word_analysis(file, []) if name == member_name[1..-1]
    end
  end
end

# 2nd task's output
class WordsNumberOutput
  def initialize(number, dictionary)
    @number = number
    @dictionary = dictionary
  end

  def words_number_output
    out = Output.new
    @number.to_i.times do |num|
      out.second_result_output(@dictionary[num][0], @dictionary[num][1])
    end
  end
end
