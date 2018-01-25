class ReleaseRepository

  ROOT_RELEASE_DIRECTORY_PATH = Rails.root.join('public', 'releases').freeze
  DESCRIPTION_FILE_NAME = 'description.md'.freeze
  VERSION_REGEX = /(\d{4}-\d{2}-\d{2}-\d{2}-\d{2}-\d{2})/

  class << self

    delegate :search, :clear_cache, :store, :find_by_version, to: :instance

  private

    def instance
      @instance ||= ReleaseRepository.new
    end

  end

  def search
    release_directories
      .map(&method(:load_single_release))
      .sort_by(&:version)
      .reverse
  end

  def store(release)
    release_directory_path = create_release_directory release
    save_description release_directory_path, release
  end

  def clear_cache
    @release_cache = {}
    @release_directories = nil
  end

  def find_by_version(version)
    search.detect { |release| release.version == version }
  end

private

  def release_directories
    @release_directories ||= Dir[join(ROOT_RELEASE_DIRECTORY_PATH, '*')]
  end

  def load_single_release(release_directory_path)
    release_cache[release_directory_path] ||= begin
      parse_single_release_directory(release_directory_path)
    end
  end

  def parse_single_release_directory(release_directory_path)
    version = VERSION_REGEX.match(release_directory_path)[1]
    description = File.read join(release_directory_path, DESCRIPTION_FILE_NAME)
    Release.new version: version, description: description
  end

  def release_cache
    @release_cache ||= {}
  end

  def join(*paths)
    paths.join '/'
  end

  def create_release_directory(release)
    join(ROOT_RELEASE_DIRECTORY_PATH, release.version).tap do |path|
      Dir.mkdir(path) unless Dir.exist?(path)
    end
  end

  def save_description(release_directory_path, release)
    description_file_path = join release_directory_path, DESCRIPTION_FILE_NAME
    File.write description_file_path, release.description
  end

end
