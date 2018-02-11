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
  it { should have_many(:days).through(:locations) }
end
