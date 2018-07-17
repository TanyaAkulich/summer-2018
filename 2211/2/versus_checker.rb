require 'io/console'
require 'optparse'
require 'russian_obscenity/base'
require 'docopt'
require_relative 'MemberControl'
require_relative 'WordsNumber'
require_relative 'WordControl'

# 1st task
class TopBadWords < MemberControl
  def initialize(number)
    foul_language(number)
  end

  def foul_language(number)
    find_members_name # method in class MemberControl
    sort_result(@members, :bad_words)
    result(number, @members)
  end

  def result(number, arr)
    number.to_i.times do |num|
      out = Output.new
      out.first_result_output(arr[num])
      puts
    end
  end
end

# Added info about existed member
class FillMembersInfo < WordsNumber
  def add_info(member, file)
    member[:battles] += 1
    member[:rounds] += 1
    FindBadWords.new(member, file)
    battle_analysis(member, file, [])
  end

  def battle_analysis(member, file, word_per_battle)
    Dir.chdir('..')
    ArrayFiller.new(file, word_per_battle)
    word_per_battle.flatten!
    words_number_in_battle(member, word_per_battle)
    words_number_in_rounds(member, word_per_battle)
  end
end

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

# Sort result array
class ResultSorter
  def initialize(arr, attr)
    @words = arr
    sort_result(attr)
  end

  def sort_result(attr)
    @words.sort_by! { |key| key[attr] * -1 }
  end
end

# 2nd task
class TopWords < WordControl
  def initialize(name, number = 30)
    @name = name
    @number = number
    favourite_words
  end

  def favourite_words
    @words = []
    member_exist
    result
  end

  def result
    sorted = words_sort([])
    out = Output.new
    out.second_result_output(@number, sorted) unless @words.empty?
    out.output_all_members(@name) if @words.empty?
  end

  def words_sort(arr_sort)
    @words.each { |elem| arr_sort << elem.to_a }
    arr_sort.flatten!(1)
    arr_sort.sort! { |first, second| (first[1] <=> second[1]) * -1 }
  end

  def member_exist
    Dir.foreach('versus-battle') do |file|
      for_delete = file[/\s{1}(против|vs|VS){1}\s{1}.+\z/]
      member_name = file.chomp(for_delete)
      word_analysis(file, []) if @name == member_name[1..-1]
    end
  end
end

# For pterry output ^__^
class Output
  def first_result_output(member)
    printf('%-25s ', member[:name])
    printf('| %-2d battles ', member[:battles])
    printf('| %-4d  total bad words ', member[:bad_words])
    printf('| %-3.2f  bad words per battle ', member[:avr_words])
    printf('| %-4d  words per round', member[:words_per_round])
  end

  def second_result_output(number, arr)
    number.to_i.times do |num|
      puts "#{arr[num][0]} - #{arr[num][1]} times"
    end
  end

  def output_all_members(name)
    puts "Рэпер #{name} не известен мне. Зато мне известны:"
    all_members_names
  end

  private

  def all_members_names
    Dir.foreach('versus-battle') do |file|
      for_delete = file[/\s{1}(против|vs|VS){1}\s{1}.+\z/]
      puts file.chomp(for_delete) unless file.include?('.') || file.include?('..')
    end
  end
end

# Read params
class Parser
  def initialize
    doc = %{
    Battle analysis

    Usage:
      #{__FILE__} --top-bad-words=<top_bad_words_number>
      #{__FILE__} --top-words=<top_words_number> --name=<name>
      #{__FILE__} --name=<name>

    Options:
      --top-bad-words=<top_bad_words_number>
      --top-words=<top_words_number>
      --name=<name>
    }
    call_doc(doc)
  end

  def call_doc(doc)
    begin
      @args = Docopt.docopt(doc)
    rescue Docopt::Exit => exp
      puts exp.message
      exit
    end
    call_method
  end

  def call_method
    call_first_task if @args['--top-bad-words']
    call_second_task if @args['--top-words'] || (@args['--name'] && !@args['--top-words'])
  end

  def call_first_task
    TopBadWords.new(@args['--top-bad-words'].to_s)
  end

  def call_second_task
    TopWords.new(@args['--name'].to_s, @args['--top-words'].to_s) if @args['--top-words']
    TopWords.new(@args['--name'].to_s) if @args['--name'] && !@args['--top-words']
  end
end

# Make dictionary
class ArrayFiller
  def initialize(file, words_array)
    @file = file
    @words = words_array
    fill_array
  end

  def fill_array
    Dir.chdir('versus-battle')
    IO.foreach(@file) do |line|
      @words << line.scan(/[А-яёA-z\d]+[^\s,\.\-\?\!]*/i)
    end
    Dir.chdir('..')
  end
end

Parser.new
