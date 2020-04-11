require 'todo'

describe Todo do
  describe '#initialize' do
    it 'initializes with an empty list' do
      expect(subject.list).to eq([])
    end

    it 'initializes with an empty done list' do
      expect(subject.done_list).to eq([])
    end
  end

  describe '#print_list' do
    it 'prints empty if there are no todos' do
      expect { subject.print_list }.to output("empty\n").to_stdout
    end

    it 'prints the todo list with an index' do
      subject.list << "This is todo number 1"
      subject.list << "This is todo number 2"
      expect { subject.print_list }.to output("1. This is todo number 1\n2. This is todo number 2\n").to_stdout
    end
  end

  describe '#print_done_list' do
    it 'prints empty if there are no done todos' do
      expect { subject.print_done_list }.to output("empty\n").to_stdout
    end

    it 'prints the done list with an index' do
      subject.done_list << "This is todo number 1"
      subject.done_list << "This is todo number 2"
      expect { subject.print_done_list }.to output("1. This is todo number 1\n2. This is todo number 2\n").to_stdout
    end
  end

  describe '#add' do
    it 'adds a todo to the list' do
      subject.add("This is todo number 1")
      expect(subject.list).to eq(["This is todo number 1"])
    end

    it 'adds multiple todos to the list' do
      subject.add("This is todo number 1")
      subject.add("This is todo number 2")
      expect(subject.list).to eq(["This is todo number 1", "This is todo number 2"])
    end
  end

  describe '#edit' do
    it 'changes the test for an existing todo' do
      subject.add("This is todo number 1")
      subject.edit(1, "This is edited todo number 1")
      expect(subject.list).to eq(["This is edited todo number 1"])
    end
  end

  describe '#done' do
    it 'copies a todo from the list array to done list' do
      subject.add("This is todo number 1")
      subject.done(1)
      expect(subject.done_list).to eq(["This is todo number 1"])
    end

    it 'deletes a done from the todo list array' do
      subject.add("This is todo number 1")
      subject.done(1)
      expect(subject.list).to eq([])
    end
  end

  describe '#start' do
    it 'prints the todo and done lists' do
      expect { subject.start }.to output("\nHere is your Todo list: \n-------------------------------------\nempty\n\nHere is your Completed list: \n-------------------------------------\nempty\n\nType ADD, EDIT, DONE or exit: \n").to_stdout
    end

    it 'allows the user to add a todo' do
      subject.add("This is todo number 1")
      expect { subject.start }.to output("\nHere is your Todo list: \n-------------------------------------\n1. This is todo number 1\n\nHere is your Completed list: \n-------------------------------------\nempty\n\nType ADD, EDIT, DONE or exit: \n").to_stdout
    end

    # it 'allows the user to input a todo' do
    #   subject { Todo.new }
    #   before do
    #     allow(subject).to receive(:gets).and_return("ADD\n", "This is test number 1\n", "exit\n")
    #   end
      
    #   specify do
    #     expect(Todo).to receive(:add).with("This is test number 1\n")
    #     subject.start
    #   end
    # end

    it 'allows the user to edit a todo' do
      subject.add("This is todo number 1")
      subject.edit(1, "This is todo number one")
      expect { subject.start }.to output("\nHere is your Todo list: \n-------------------------------------\n1. This is todo number one\n\nHere is your Completed list: \n-------------------------------------\nempty\n\nType ADD, EDIT, DONE or exit: \n").to_stdout
    end

    it 'allows the user to make a todo done' do
      subject.add("This is todo number 1")
      subject.done(1)
      expect { subject.start }.to output("\nHere is your Todo list: \n-------------------------------------\nempty\n\nHere is your Completed list: \n-------------------------------------\n1. This is todo number 1\n\nType ADD, EDIT, DONE or exit: \n").to_stdout
    end

  end
end
