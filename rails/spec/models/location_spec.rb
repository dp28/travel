require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should have_db_column(:id) }
  it { should have_db_column(:created_at) }

  %i[name latitude longitude type area_id].each do |column|
    it { should have_db_column(column).with_options(null: false) }
    it { should validate_presence_of column }
  end

  it do
    should validate_inclusion_of(:type).in_array(
      %w[
        ACCOMMODATION
        AIRPORT
        STATION
      ]
    )
  end

  it { should belong_to :area }
  it { should have_many(:days).through(:day_locations) }
end
