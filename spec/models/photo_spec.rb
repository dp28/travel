require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { should have_db_column(:id) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:caption) }
  it { should have_db_column(:favourite).with_options(default: false) }

  %i[url day_id width height].each do |column|
    it { should have_db_column(column).with_options(null: false) }
    it { should validate_presence_of column }
  end

  it { should have_db_index(%i[url day_id]).unique }

  it { should belong_to :day }

  describe '#aspect_ratio' do
    it 'should be the width divided by the height' do
      expect(Photo.new(width: 13, height: 4).aspect_ratio).to eq 13.0 / 4.0
    end
  end
end
