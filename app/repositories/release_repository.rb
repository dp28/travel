class ReleaseRepository

  RELEASE_DIRECTORIES_PATH = Rails.root.join('releases/*').freeze

  class << self

    def search
      instance.search
    end

    def clear_cache
      instance.clear_cache
    end

  private

    def instance
      @instance ||= ReleaseRepository.new
    end

  end

  def search
    release_directories.map(&method(:load_single_release))
  end

  def clear_cache
    @release_cache = {}
  end

private

  def release_directories
    @release_directories ||= Dir[RELEASE_DIRECTORIES_PATH]
  end

  def load_single_release(release_directory_path)
    release_cache[release_directory_path] ||= begin
      parse_single_release_directory(release_directory_path)
    end
  end

  def parse_single_release_directory(release_directory_path)
    metadata = YAML.load_file "#{release_directory_path}/metadata.yml"
    description = File.read "#{release_directory_path}/description.md"
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

end
