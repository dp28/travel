require 'rails_helper'

RSpec.describe PostRepository do
  subject(:repo) { PostRepository.new }

  describe '#search' do
    context 'without any Posts' do
      it 'should return an empty array' do
        expect(repo.search).to eq([])
      end
    end

    context 'with two Posts' do
      before do
        [1, 2].each do |i|
          FactoryBot.create(
            :post,
            title: "Post #{i}",
            content: 'Great content',
            created_at: 1.day.ago + i.hours
          )
        end
      end

      it 'should return a result for each Post' do
        expect(repo.search.size).to eq 2
      end

      it 'should be ordered by published_at, descending' do
        releases = repo.search
        expect(releases.map(&:title)).to eq ['Post 2', 'Post 1']
      end

      it 'should return Posts' do
        repo.search.each { |post| expect(post).to be_a(Post) }
      end
    end
  end

  describe '#store' do
    it 'should call #save on the Post' do
      post = Post.new
      expect(post).to receive(:save)
      repo.store post
    end

    it 'should return the Post' do
      post = Post.new
      expect(repo.store(post)).to eq post
    end
  end

  describe '#find_by_id' do
    it 'should return nil if no Post exists with that id' do
      expect(repo.find_by_id('a')).to be_nil
    end

    it 'should return a Post with the id if it exists' do
      id = FactoryBot.create(:post).id
      expect(
        repo.find_by_id(id).id
      ).to eq id
    end
  end
end
