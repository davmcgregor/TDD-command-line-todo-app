class Todo
  attr_reader :list, :done_list

  def initialize
    @list = []
    @done_list = []
  end
  
  def print_list
    if @list.length < 1
      puts "empty"
    else
      @list.each_with_index do | todo, index |
        puts "#{index + 1}. #{todo}"
      end
    end
  end

  def print_done_list
    if @done_list.length < 1
      puts "empty"
    else
      @done_list.each_with_index do | todo, index |
        puts "#{index + 1}. #{todo}"
      end
    end
  end

  def add(new_todo)
    @list << new_todo
  end

  def edit(todo_num, todo_edit)
    @list[todo_num - 1] = todo_edit
  end

  def done(done_num)
    @done_list << @list[done_num - 1]
    @list.delete_at(done_num - 1)
  end

  def start
  loop do
    puts "\nHere is your Todo list:"
    puts "-" * 37
    print_list
    puts "\nHere is your Completed list:"
    puts "-" * 37
    print_done_list
    puts "\nType ADD, EDIT, DONE or exit: "
    user_input = STDIN.gets.chomp
    case user_input
      when "ADD"
        puts "Please enter new todo: "
        new_todo = STDIN.gets.chomp
        add(new_todo)
      when "EDIT"
        puts "Please enter the number of the todo you wish to edit: "
        todo_num = STDIN.gets.chomp.to_i
        puts @list[todo_num - 1]
        puts "Please enter new todo text: "
        todo_edit = STDIN.gets.chomp
        edit(todo_num, todo_edit)
      when "DONE"
        puts "Please enter the number of the todo you have done: "
        done_num = STDIN.gets.chomp.to_i
        done(done_num)
      when "exit"
        break
      end
    end
  end

end