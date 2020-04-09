class Todo
  attr_reader :list

  def initialize
    @list = []
    print
  end
  
  def add(input)
    @list << input
    print
  end

  def print
    @list.each_with_index do | todo, index |
      puts "#{index + 1}. #{todo}"
    end
  end

  def complete(todo_num, todo_text)
    @list[todo_num -1] = todo_text
    print
  end

end