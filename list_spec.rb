require "rspec"
 
require_relative "list"
 
describe List do
  
  let(:title) { 'Our List' }
  let(:list) { List.new(title)}
  let(:tasks) { [Task.new("Wipe down keyboard"), Task.new("Do laundry")] }

  describe '#initialize' do
    context "with valid input" do
      it 'should have a title' do
        list.title.should eq(title)
      end

      it 'should have no tasks if none are given' do
        list.tasks.should eq([])
      end  

      it "should have tasks if some are given" do
        List.new(title, tasks).tasks.count.should eq(2)
      end
    end
 
    context "with invalid input" do
      it "throws an argument error when not given a title" do
        expect { List.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#add_task' do
    it "should add a task to the list" do
      list.add_task(Task.new("Get lunch"))
      list.tasks[0].description.should eq("Get lunch")
    end
  end

  describe '#complete_task' do
    it "should mark a task as complete" do
      list.add_task(Task.new("Get lunch"))
      list.complete_task(0)
      list.tasks[0].complete?.should eq(true)
    end
  end

  describe '#delete_task' do
    it "should delete a task" do
      list.add_task(Task.new("Get lunch"))
      list.delete_task(0)
      list.tasks.count eq(0)
    end
  end

  describe '#completed_tasks' do
    it "should list all the completed tasks" do
      list.add_task(Task.new("Get lunch"))
      list.add_task(Task.new("Eat lunch"))
      list.complete_task(0)
      list.completed_tasks.count eq(1)
    end    
  end

  describe '#incomplete_tasks' do
    it "should list all the incomplete tasks" do
      list.add_task(Task.new("Get lunch"))
      list.add_task(Task.new("Eat lunch"))
      list.incomplete_tasks.count eq(2)
    end
  end
end
