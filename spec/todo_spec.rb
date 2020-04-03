require 'todo'

describe Todo do
  describe '#initialize' do
    it 'initializes with an empty list' do
      expect(subject.list).to eq([])
    end

    it 'prints the todo list to the console' do
      expect{ myTodo = Todo.new }.to output([]).to_stdout
    end
  end
  
  describe '#Add' do
    it 'Prints a todo item to the console' do
      expect do
        Todo.new.Add('test')
      end.to output("hello\n").to_stdout
    end

    it 'Adds a todo item to the todo list' do
      subject.Add('test')
      expect(subject.list).to include('test')
    end

    # it 'Adds a todo item to the todo list with an ' do
    #   subject.Add('test')
    #   expect(subject.list).to include('test')
    # end
  end
end