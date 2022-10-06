require 'rails_helper'

RSpec.describe ReleaseRepository do
  let(:mock_directories_path) do
    Rails.root.join 'spec/support/mock_data/releases'
  end

  before do
    stub_const(
      'ReleaseRepository::ROOT_RELEASE_DIRECTORY_PATH', mock_directories_path
    )
    ReleaseRepository.clear_cache
  end

  describe '#search' do
    it 'should return a result for each release in the releases directory' do
      expect(ReleaseRepository.search.size).to eq 2
    end

    it 'should be ordered by release time, descending' do
      releases = ReleaseRepository.search
      expect(releases.map(&:version)).to eq [
        '2017-12-26-12-53-35', '2017-12-22-11-52-34'
      ]
    end

    describe 'each returned Release' do
      subject(:release) { ReleaseRepository.search.last }
      let(:asset) { '/releases/2017-12-22-11-52-34/travel' }

      it 'should have the version defined in the directory name' do
        expect(release.version).to eq '2017-12-22-11-52-34'
      end

      it 'should have the javascript link defined from the version' do
        expect(release.links.javascript).to eq "#{asset}.js"
      end

      it 'should have the css link defined in the metadata file' do
        expect(release.links.css).to eq "#{asset}.css"
      end

      it 'should have the content of the description file as its description' do
        expect(release.description).to \
          eq("Some useful description in GitHub-flavoured **markdown**.\n")
      end
    end

    it 'should be cached' do
      expect(File).to receive(:read).twice.and_return('A description')
      ReleaseRepository.search
      ReleaseRepository.search
    end
  end

  describe '#store' do
    subject(:store) { ReleaseRepository.store release }

    let(:release) do
      Release.new version: '2017-12-20-12-30-35', description: 'A descriptipn'
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
  end

  describe '#find_by_version' do
    it 'should return nil if no Release exists with that version' do
      expect(ReleaseRepository.find_by_version('a')).to be_nil
    end

    it 'should return a Release with the version if it exists' do
      version = ReleaseRepository.search.first.version
      expect(
        ReleaseRepository.find_by_version(version).version
      ).to eq version
    end
  end
end
