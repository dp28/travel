class ReleaseRepository

  ROOT_RELEASE_DIRECTORY_PATH = Rails.root.join('releases').freeze
  DESCRIPTION_FILE_NAME = 'description.md'.freeze
  METADATA_FILE_NAME = 'metadata.yml'.freeze

  class << self

    delegate :search, :clear_cache, :store, to: :instance

  private

    def instance
      @instance ||= ReleaseRepository.new
    end

  end

  def search
    release_directories.map(&method(:load_single_release))
  end

  def store(release)
    release_directory_path = create_release_directory release
    save_description release_directory_path, release
    save_metadata release_directory_path, release
  end

  def clear_cache
    @release_cache = {}
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
    metadata = YAML.load_file join(release_directory_path, METADATA_FILE_NAME)
    description = File.read join(release_directory_path, DESCRIPTION_FILE_NAME)
    Release.new(
      version: metadata['version'],
      description: description,
      javascript: metadata['links']['javascript'],
      css: metadata['links']['css']
    )
  end

  def release_cache
    @release_cache ||= {}
  end

  def join(*paths)
    paths.join '/'
  end

  def create_release_directory(release)
    join(ROOT_RELEASE_DIRECTORY_PATH, release.version).tap do |path|
      Dir.mkdir(path)
    end
  end

  def save_description(release_directory_path, release)
    description_file_path = join release_directory_path, DESCRIPTION_FILE_NAME
    File.write description_file_path, release.description
  end

  def save_metadata(release_directory_path, release)
    metadata_file_path = join release_directory_path, METADATA_FILE_NAME
    metadata_hash = map_release_to_metadata_hash release
    metadata_yaml = YAML.dump metadata_hash
    File.write metadata_file_path, metadata_yaml
  end

  def map_release_to_metadata_hash(release)
    {
      'version' => release.version,
      'links' => {
        'javascript' => release.links.javascript,
        'css' => release.links.css
      }
    }
  end

end
