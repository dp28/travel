require 'rails_helper'

RSpec.describe FoodOccurrences do
  subject(:food_occurrences) { FoodOccurrences.new day_numbers: days.map(&:number) }

  shared_examples_for 'not having any occurrences' do
    it 'should not have any occurrences' do
      expect(food_occurrences.occurrences).to eq []
    end
  end

  describe 'without any days' do
    let(:days) { [] }
    it_should_behave_like 'not having any occurrences'
  end

  describe 'with days without meals' do
    let(:days) { FactoryBot.create_list :day, 1 }
    it_should_behave_like 'not having any occurrences'
  end

  describe 'with days with meals without food' do
    let(:days) { FactoryBot.create_list :day, 1 }

    before do
      days.each { |day| FactoryBot.create :meal, day: day }
    end

    it_should_behave_like 'not having any occurrences'
  end

  describe 'with a single day with meals with food' do
    let(:days) { FactoryBot.create_list :day, 1 }
    let(:food_1) { FactoryBot.create :food }
    let(:food_2) { FactoryBot.create :food }
    let!(:meal_1) { FactoryBot.create :meal, day: days.first }
    let!(:meal_2) { FactoryBot.create :meal, day: days.first }

    context 'when each food is only in one meal' do
      before do
        meal_1.foods << food_1
        meal_2.foods << food_2
      end

      it 'should have an occurrence for each food, each with a count of 1' do
        occurrences = food_occurrences.occurrences.map { |o| [o.name, o.count] }
        expect(occurrences).to eq [[food_2.name, 1], [food_1.name, 1]]
      end
    end

    context 'when one food is only in one meal and the other is in both' do
      before do
        meal_1.foods << food_1
        meal_1.foods << food_2
        meal_2.foods << food_2
      end

      it 'should have an occurrence for the food that was eaten once with a count of one' do
        expect(
          food_occurrences.occurrences.detect { |o| o.name == food_1.name }.count
        ).to eq 1
      end

      it 'should have an occurrence for the food that was eaten twice with a count of two' do
        expect(
          food_occurrences.occurrences.detect { |o| o.name == food_2.name }.count
        ).to eq 2
      end

      it 'should order the occurrences by count, descending' do
        expect(food_occurrences.occurrences.map(&:name)).to eq([food_2.name, food_1.name])
      end
    end
  end
end
