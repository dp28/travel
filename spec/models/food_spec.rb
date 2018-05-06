require 'rails_helper'

RSpec.describe Food, type: :model do
  it { should have_db_column(:id) }
  it { should have_db_column(:created_at) }

  it { should have_db_column(:name).with_options(null: false) }
  it { should validate_presence_of :name }
  it { should have_db_index(:name).unique }

  it 'should throw an error if the name is nil' do
    expect { Food.create!(name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
