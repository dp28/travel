require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should have_db_column(:id) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:accommodation) }

  %i[place_name latitude longitude country_id].each do |column|
    it { should have_db_column(column).with_options(null: false) }
    it { should validate_presence_of column }
  end

  it { should belong_to :country }
  it { should have_many(:days).through(:day_locations) }
end
