class Todo
  attr_reader :list

  def initialize
    @list = []
    puts []
  end
  
  def Add(input)
    @list << input
    puts "hello"
  end
end