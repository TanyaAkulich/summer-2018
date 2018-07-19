require_relative '../WordControl'
require_relative '../AllMembersNames'

# 2nd task
class TopWords < WordControl
  attr_reader :words
  attr_reader :name
  attr_reader :number
  def initialize(name, number)
    super
    @sorted = []
  end

  def favourite_words
    member_exist
    result
  end

  def result
    words_sort
    words_number_output(number) unless words.empty?
    output_all_members(name) if words.empty?
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

  def words_number_output(number)
    number.to_i.times do |num|
      puts "#{@sorted[num][0]} - #{@sorted[num][1]} times"
    end
  end

  def output_all_members(name)
    puts "Рэпер #{name} не известен мне. Зато мне известны:"
    AllMembersNames.new.all_members_names
  end
end
