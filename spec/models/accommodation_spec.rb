require 'rails_helper'

RSpec.describe Accommodation, type: :model do
  it { should belong_to :day }
  it { should belong_to :location }
end
