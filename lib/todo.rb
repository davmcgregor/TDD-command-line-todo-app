class Todo
  attr_reader :list, :done_list

  def initialize
    @list = []
    @done_list = []
    print_list
    menu
  end
  
  def print_list
    puts "\nHere is your Todo list:"
    puts "-" * 37
    if @list.length < 1
      puts "empty"
    else
      @list.each_with_index do | todo, index |
        puts "#{index + 1}. #{todo}"
      end
    end
  end

  def print_done_list
    puts "\nHere is your Completed list:"
    puts "-" * 37
    if @done_list.length < 1
      puts "empty"
    else
      @done_list.each_with_index do | todo, index |
        puts "#{index + 1}. #{todo}"
      end
    end
  end

  def menu
    puts "\nType ADD, EDIT, DONE or exit: "
    user_input = STDIN.gets.chomp
    case user_input
      when "ADD"
        add
      when "EDIT"
        edit
      when "DONE"
        done
      when "exit"
        exit
      else
        print_list
        print_done_list
        menu
    end
  end

  def add
    puts "Please enter new todo: "
    new_todo = STDIN.gets.chomp
    @list << new_todo
    print_list
    print_done_list
    menu
  end

  def edit
    puts "Please enter the number of the todo you wish to edit: "
    todo_num = STDIN.gets.chomp.to_i
    puts @list[todo_num - 1]
    puts "Please enter new todo text: "
    @list[todo_num - 1] = STDIN.gets.chomp
    print_list
    print_done_list
    menu
  end

  def done
    puts "Please enter the number of the todo you have completed: "
    done_num = STDIN.gets.chomp.to_i
    @donelist << @list[done_num - 1]
    @list.delete_at(done_num - 1)
    print_list
    print_done_list
    menu
  end

end