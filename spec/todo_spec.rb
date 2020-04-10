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
    it 'prints an empty todo list' do
      expect { subject.print_list }.to output("\nHere is your Todo list:\n-------------------------------------\nempty\n").to_stdout
    end

    it 'prints the todo list with an index' do
      subject.list << "This is test todo number 1"
      expect { subject.print_list }.to output("\nHere is your Todo list:\n-------------------------------------\n1. This is test todo number 1\n").to_stdout
    end
  end

  describe '#print_done_list' do
    it 'prints an empty done list' do
      expect { subject.print_done_list }.to output("\nHere is your Completed list:\n-------------------------------------\nempty\n").to_stdout
    end

    it 'prints the done list with an index' do
      subject.done_list << "This is test done number 1"
      expect { subject.print_done_list }.to output("\nHere is your Completed list:\n-------------------------------------\n1. This is test done number 1\n").to_stdout
    end
  end

  describe '#add' do
    it 'allows a user to ADD a todo' do
      allow(subject).to receive(:gets).and_return("ADD\n", "This is todo 1\n", "exit\n")
      subject.add
      expect(subject.list).to eq(["This is todo 1\n"])
    end
  end

  #   it 'adds a todo item' do
  #     displayer.stub(:gets).and_return("ADD\n")
  #     expect(displayer.meny)
  #     expect do
  #       subject.menu
  #     end.to output("Please enter new todo: \n").to_stdout
  #   end
  
  #   # it 'Prints out a selection of commands' do
  #   #   expect do
  #   #     subject.menu
  #   #   end.to output("\nType ADD, EDIT, DONE or exit: ").to_stdout
  #   # end

  # end

  # describe '#add' do
  #   it 'Prints a todo item to the console' do
  #     expect do
  #       subject.add("this is a test todo")
  #     end.to output("1. this is a test todo\n").to_stdout
  #   end

  #   it 'adds a todo item to the todo list' do
  #     subject.add("this is a test todo")
  #     expect(subject.list).to include("this is a test todo")
  #   end
  # end

end