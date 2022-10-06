require 'rails_helper'

RSpec.describe Meal, type: :model do
  it { should have_db_column(:id) }
  it { should have_db_column(:created_at) }

  it { should have_db_column(:ordering).with_options(null: false) }
  it { should validate_presence_of :ordering }
  it { should have_db_index(%i[day_id ordering]).unique }

  it { should belong_to :day }
  it { should have_many(:meal_foods).dependent(:destroy) }
  it { should have_many(:foods).through(:meal_foods) }

  describe '#ordering' do
    it 'should have to be unique within a Day' do
      day = FactoryBot.create :day
      FactoryBot.create :meal, day: day, ordering: 1
      expect { FactoryBot.create :meal, day: day, ordering: 1 }.to \
        raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should not have to be unique between Days' do
      FactoryBot.create :meal, ordering: 1
      expect { FactoryBot.create :meal, ordering: 1 }.not_to raise_error
    end
  end
end
