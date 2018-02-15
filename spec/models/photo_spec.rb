require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { should have_db_column(:id) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:caption) }
  it { should have_db_column(:favourite).with_options(default: false) }

  %i[url day_id].each do |column|
    it { should have_db_column(column).with_options(null: false) }
    it { should validate_presence_of column }
  end

  it { should have_db_index(%i[url day_id]).unique }

  it { should belong_to :day }
end
