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
  it { should have_many(:days).through(:locations) }
end
