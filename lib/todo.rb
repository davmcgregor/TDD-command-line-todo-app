class Todo
  attr_reader :list

  def initialize
    @list = []
    puts []
  end
  
  def add(input)
    @list << input
    puts input
  end

end