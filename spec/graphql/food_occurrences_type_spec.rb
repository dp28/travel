require 'rails_helper'

RSpec.describe 'foodOccurrences', type: :request do
  include GraphqlSpecHelper

  let(:query) do
    %({
      foodOccurrences {
        name
        count
      }
    })
  end

  let(:occurrences) { result[:data][:foodOccurrences] }
  let(:food) { FactoryBot.create :food }

  before do
    day = FactoryBot.create :day
    meal = FactoryBot.create :meal, day: day
    meal.foods << food
  end

  it 'should return an array' do
    expect(occurrences).to be_an Array
  end

  it 'should have the name of the food' do
    expect(occurrences.first[:name]).to eq food.name
  end

  it 'should have the count of times the food was consumed' do
    expect(occurrences.first[:count]).to eq 1
  end
end
