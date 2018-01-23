require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should have_db_column(:id) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:title).with_options(null: true) }
  it { should_not validate_presence_of(:title) }

  %i[content written_at].each do |column|
    it { should have_db_column(column).with_options(null: false) }
    it { should validate_presence_of column }
  end

  describe '#published_at' do
    subject(:published_at) { post.published_at }
    let(:post) { Post.new(created_at: Time.now) }

    it 'should be the same as the Post\'s created_at' do
      expect(published_at).to eq(post.created_at)
    end
  end
end
