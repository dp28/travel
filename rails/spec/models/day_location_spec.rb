require 'rails_helper'

RSpec.describe DayLocation, type: :model do
  it { should have_db_index(%i[day_id location_id]).unique }

  %i[day_id location_id].each do |column|
    it { should have_db_column(column).with_options(null: false) }
  end
end
