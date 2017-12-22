require 'rails_helper'

RSpec.describe ReleaseRepository do
  before do
    stub_const(
      'ReleaseRepository::RELEASE_DIRECTORIES_PATH',
      Rails.root.join('spec/support/mock_data/releases/*')
    )
  end

  describe 'search' do
    it 'should return a result for each release in the releases directory' do
      expect(ReleaseRepository.search.size).to eq 1
    end

    describe 'each returned Release' do
      subject(:release) { ReleaseRepository.search.first }

      it 'should have the version defined in the directory name' do
        expect(release.version).to eq '2017-12-22-11-52-34'
      end

      it 'should have the javascript link defined in the metadata file' do
        expect(release.links.javascript).to eq '/assets/js/something.js'
      end

      it 'should have the css link defined in the metadata file' do
        expect(release.links.css).to eq '/assets/css/something.css'
      end

      it 'should have the content of the description file as its description' do
        expect(release.description).to \
          eq("Some useful description in GitHub-flavoured **markdown**.\n")
      end
    end

    it 'should be cached' do
      mock_metadata = {
        'version' => 'a',
        'links' => {
          'javascript' => 'b',
          'css' => 'c'
        }
      }
      expect(YAML).to receive(:load_file).once.and_return(mock_metadata)
      ReleaseRepository.clear_cache
      ReleaseRepository.search
      ReleaseRepository.search
      ReleaseRepository.clear_cache
    end
  end
end
