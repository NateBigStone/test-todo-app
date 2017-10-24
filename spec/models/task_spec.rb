require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do
    it 'should switch complete to false if it began as true' do
      task = Task.create(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end
      it 'should switch complete to true if it began as false' do
      task = Task.create(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end
  describe '#toggle_favorite!' do
    it 'should switch favorite to false if it began as true' do
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
    it 'should switch favorite to true if it began as false' do
      task = Task.create(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end
  describe '#overdue' do
    it 'should return true if the current time is past the deadline' do
      task = Task.create(deadline: Time.now - 1.hour)
      task.overdue?
      expect(task.overdue?).to eq(true)
    end
    it 'should return false if the current time is before the deadline' do
      task = Task.create(deadline: Time.now + 1.hour)
      task.overdue?
      expect(task.overdue?).to eq(false)
    end
  end
  describe '#increment_priority' do
    it 'should increment the priority by one if it is less than 10' do
      task = Task.create(priority: 5)
      task.increment_priority!
      expect(task.priority).to eq(6)
    end
    it 'should decrement the priority by one if it is more than -1' do
      task = Task.create(priority: 5)
      task.decrement_priority!
      expect(task.priority).to eq(4)
    end
  end
  describe '#snooze_hour' do
    it 'should add 1 hour to the deadline datetime' do
      now_time_object = Time.now
      task = Task.create(deadline: now_time_object)
      task.snooze_hour!
      expect(task.deadline).to eq(now_time_object + 1.hour)
    end
  end
end
