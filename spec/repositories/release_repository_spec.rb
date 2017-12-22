require 'rails_helper'

RSpec.describe ReleaseRepository do
  let(:mock_directories_path) do
    Rails.root.join 'spec/support/mock_data/releases'
  end

  before do
    stub_const(
      'ReleaseRepository::ROOT_RELEASE_DIRECTORY_PATH', mock_directories_path
    )
  end

  describe '#search' do
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

  describe '#store' do
    subject(:store) { ReleaseRepository.store release }

    let(:release) do
      Release.new(
        version: '2017-12-20-12-30-35',
        description: 'A descriptipn',
        javascript: '/a/link.js',
        css: '/a/link.css'
      )
    end

    let(:release_directory_path) do
      "#{mock_directories_path}/#{release.version}"
    end

    before do
      allow(Dir).to receive(:mkdir)
      allow(File).to receive(:write)
    end

    it 'should create a release directory with the version as its name' do
      expect(Dir).to receive(:mkdir).with(release_directory_path)
      store
    end

    it 'should write the description to a description.md file' do
      expected_file = "#{release_directory_path}/description.md"
      expect(File).to receive(:write).with(expected_file, release.description)
      store
    end

    it 'should write the metadata to a metadata.yml file' do
      expected_file = "#{release_directory_path}/metadata.yml"
      expected_content = "---\n" \
        "version: #{release.version}\n" \
        "links:\n" \
        "  javascript: \"#{release.links.javascript}\"\n" \
        "  css: \"#{release.links.css}\"\n"
      expect(File).to receive(:write).with(expected_file, expected_content)
      store
    end
  end
end
