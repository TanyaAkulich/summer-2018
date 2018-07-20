require 'io/console'
require 'optparse'
require 'docopt'
require_relative 'tasks/TopBadWords'
require_relative 'tasks/TopWords'

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

Parser.new.parse_and_run_task
