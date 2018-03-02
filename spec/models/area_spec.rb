require 'rails_helper'

RSpec.describe Area, type: :model do
  it { should have_db_column(:id) }
  it { should have_db_column(:created_at) }

  %i[name country_id].each do |column|
    it { should have_db_column(column).with_options(null: false) }
    it { should validate_presence_of column }
  end

  it { should belong_to :country }
  it { should have_many :locations }
  it { should have_many(:accommodations).through(:locations) }
  it { should have_many(:days).through(:accommodations) }

  describe '#total_expense' do
    it 'should be a TotalExpense created with the Days for the Area' do
      location = FactoryBot.create :location
      accommodation = FactoryBot.create :accommodation, location: location
      area = location.area
      day = FactoryBot.create :day, accommodation: accommodation
      day_expense = FactoryBot.create :expense, day: day
      FactoryBot.create :expense

      expect(area.total_expense.amount).to eq day_expense.amount
    end
  end
end
