require 'rails_helper'

RSpec.describe Post, type: :model do
  %i[title content].each do |column|
    it { should have_db_column(column).with_options(null: false) }
    it { should validate_presence_of column }
  end
end
