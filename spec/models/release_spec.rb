require 'rails_helper'

RSpec.describe Release do
  def build_release(**params)
    params[:description] ||= 'test'
    params[:javascript] ||= 'test'
    params[:css] ||= 'test'
    Release.new(params)
  end

  describe '#version' do
    it 'should be settable in the constructor' do
      version = '2017-12-20-10-01-30'
      expect(build_release(version: version).version).to eq(version)
    end

    it 'should default to a timestamp of the current time' do
      allow(Time).to receive(:now).and_return(Time.new(2017, 11, 12, 10, 13, 14))
      version = build_release.version
      tag = '2017-11-12-10-13-14'
      expect(version).to eq(tag)
    end

    it 'should always be 19 characters long' do
      allow(Time).to receive(:now).and_return(Time.new(2017, 1, 2, 0, 3, 4))
      expect(build_release.version).to eq('2017-01-02-00-03-04')
    end
  end

  describe '#time' do
    it 'should default to now' do
      expect(build_release.time).to be_within(1.second).of(Time.now)
    end

    it 'should be parsed from the version if that is provided' do
      release = build_release(version: '2017-12-25-00-01-59')
      expect(release.time).to eq(Time.new(2017, 12, 25, 0, 1, 59))
    end

    it 'should be UTC' do
      expect(build_release.time.utc?).to be_truthy
    end
  end

  describe '#description' do
    it 'should be settable in the constructor' do
      description = 'a description'
      release = build_release(description: description)
      expect(release.description).to eq(description)
    end
  end

  describe 'links' do
    describe 'javascript' do
      it 'should be settable from the constructor' do
        expect(build_release(javascript: 'js').links.javascript).to eq('js')
      end
    end

    describe 'css' do
      it 'should be settable from the constructor' do
        expect(build_release(css: 'css').links.css).to eq('css')
      end
    end
  end
end
