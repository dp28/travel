require 'rails_helper'

RSpec.describe Country, type: :model do
  it { should have_db_column(:id) }
  it { should have_db_column(:created_at) }

  %i[name currency_code].each do |column|
    it { should have_db_column(column).with_options(null: false) }
    it { should validate_presence_of column }
  end

  it { should have_db_index(:name).unique }
  it { should have_many :areas }
  it { should have_many(:locations).through(:areas) }
  it { should have_many(:days).through(:areas) }

  describe '#total_expense' do
    it 'should be a TotalExpense created with the Days for the Country' do
      location = FactoryBot.create :location
      accommodation = FactoryBot.create :accommodation, location: location
      country = location.area.country
      day = FactoryBot.create :day, accommodation: accommodation
      day_expense = FactoryBot.create :expense, day: day
      FactoryBot.create :expense

      expect(country.total_expense.amount).to eq day_expense.amount
    end
  end

  describe '#food_occurrences' do
    it 'should be FoodOccurrences created with the Days for the Country' do
      location = FactoryBot.create :location
      accommodation = FactoryBot.create :accommodation, location: location
      country = location.area.country
      day = FactoryBot.create :day, accommodation: accommodation
      day_meal = FactoryBot.create :meal, day: day
      food = FactoryBot.create :food
      day_meal.foods << food
      FactoryBot.create :food

      expect(country.food_occurrences.first.name).to eq food.name
    end
  end
end
