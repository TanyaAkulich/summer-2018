# Transform hashes in arrays and sort fot second value
class SortWords
  def initialize
    @sorted = []
  end

  def words_sort(words)
    words.each { |elem| @sorted << elem.to_a }
    @sorted.flatten!(1)
    @sorted.sort! { |first, second| (first[1] <=> second[1]) * -1 }
  end
end
