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
      end.to output("1. this is a test todo\n").to_stdout
    end

    it 'adds a todo item to the todo list' do
      subject.add("this is a test todo")
      expect(subject.list).to include("this is a test todo")
    end
  end

  describe '#print' do
    it 'Prints the entire list of todos' do
      subject.add("this is the first todo")
      subject.add("this is the second todo")
      expect do
        subject.print
      end.to output("1. this is the first todo\n2. this is the second todo\n").to_stdout
    end
  end

  describe '#complete' do
    it 'allows incomplete todos to be edited' do
      subject.add("this is the first t...")
      subject.complete(1, "this is the first todo")
      expect(subject.list[0]).to eq("this is the first todo")
    end
  end
end