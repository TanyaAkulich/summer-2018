# countes battles number
class RoundsCounter
  def initialize(member, file)
    @file = file
    @member = member
    @count = 0
  end

  def file_read
    Dir.chdir('versus-battle')
    IO.foreach(@file) { |line| @count += 1 if /^(Р|р)аунд \d/ =~ line }
    Dir.chdir('..')
    find_rounds
  end

  def find_rounds
    extra if @count.zero?
    @member[:rounds] += @count
  end

  def extra
    @count = 1
  end
end
