require 'rails_helper'

RSpec.describe Day do
  it { should have_db_column(:id) }
  it { should have_db_column(:number).with_options(null: false) }
  it { should have_db_index(:number).unique }
  it { should validate_presence_of :number }
  it { should validate_numericality_of(:number).is_greater_than(0) }
end
