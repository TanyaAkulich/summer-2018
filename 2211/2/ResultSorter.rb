# Sort result array
class ResultSorter
  def initialize(arr, attr)
    @words = arr
    @attr = attr
  end

  def sort_result
    @words.sort_by! { |key| key[@attr] * -1 }
  end
end
