require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#snooze_all_tasks' do
    it 'should snooze every task' do
      now_time_object = Time.now
      list = List.create(name: "chores")
      Task.create(name: "Take Out Trash", deadline: now_time_object, list_id: list.id)
      Task.create(name: "Take a Nap", deadline: now_time_object, list_id: list.id)
      tasks = Task.all

      list.snooze_all_tasks!
      tasks.each do |task|
        expect(task.deadline).to eq(now_time_object + 1.hour)
      end
    end
  end
end
