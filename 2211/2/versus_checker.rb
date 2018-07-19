require 'io/console'
require 'optparse'
require 'russian_obscenity/base'
require 'docopt'
require_relative 'MemberControl'
require_relative 'WordsNumber'
require_relative 'WordControl'
require_relative 'tasks/TopBadWords'
require_relative 'tasks/TopWords'

# For pterry output ^__^
class Output
  def first_result_output(member)
    printf('%-25s ', member[:name])
    printf('| %-2d battles ', member[:battles])
    printf('| %-4d  total bad words ', member[:bad_words])
    printf('| %-3.2f  bad words per battle ', member[:avr_words])
    printf('| %-4d  words per round', member[:words_per_round])
  end

  def second_result_output(word, number)
    puts "#{word} - #{number} times"
  end

  def output_all_members(name)
    puts "Рэпер #{name} не известен мне. Зато мне известны:"
    all_members_names
  end

  private

  attr_accessor :file
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

# Read params
class Parser
  def args
    Docopt.docopt(doc)
  rescue Docopt::Exit => exp
    puts exp.message
    exit
  end

  def doc
    %{
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
  end

  def parse_and_run_task
    find_all_bad_words if arguments_for_top_bad_words_present?
    find_favourite_battlers_words if arguments_for_top_words_present?
    find_favourite_battlers_words if arguments_for_name_present? && !arguments_for_top_words_present?
  end

  def arguments_for_top_bad_words_present?
    args['--top-bad-words']
  end

  def arguments_for_top_words_present?
    args['--top-words']
  end

  def arguments_for_name_present?
    args['--name']
  end

  def find_all_bad_words
    TopBadWords.new.foul_language(args['--top-bad-words'].to_i)
  end

  def find_favourite_battlers_words
    puts args['--top-words']
    TopWords.new(args['--name'].to_s, args['--top-words']).favourite_words
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

Parser.new.parse_and_run_task
