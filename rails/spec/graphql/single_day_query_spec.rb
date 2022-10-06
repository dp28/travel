require 'rails_helper'

RSpec.describe 'day($number)', type: :request do
  include GraphqlSpecHelper

  let(:query) do
    %({
      day(number: #{day_number}) {
        number
      }
    })
  end

  let!(:day) { FactoryBot.create :day }
  let(:day_number) { day.number }

  it 'should return a DayType with the correct number' do
    expect(result[:data][:day][:number]).to eq(day.number)
  end

  context 'if there is no Day with the number' do
    let(:day_number) { -1 }

    it 'should return null' do
      expect(result[:data][:day]).to eq(nil)
    end
  end
end
