require 'todo'

describe Todo do
  describe '#initialize' do
    it 'initializes with an empty list' do
      expect(subject.list).to eq([])
    end

    it 'prints the todo list to the console' do
      expect do
        myTodo = Todo.new
      end.to output("").to_stdout
    end
  end
  
  describe '#add' do
    it 'Prints a todo item to the console' do
      expect do
        subject.add("this is a test todo")
      end.to output("this is a test todo\n").to_stdout
    end

    it 'adds a todo item to the todo list' do
      subject.add("this is a test todo")
      expect(subject.list).to include("this is a test todo")
    end
  end
end