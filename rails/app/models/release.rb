# Doesn't inherit from ApplicationRecord because it isn't database-backed
class Release

  APP_NAME = 'travel'.freeze
  RELEASES_PATH = '/releases'.freeze
  JAVASCRIPT_EXTENSION = 'js'.freeze
  CSS_EXTENSION = 'css'.freeze

  attr_reader :description, :links

  Links = Struct.new(:javascript, :css)

  def initialize(description:, version: nil)
    @version = version
    @description = description
    @links = Links.new(
      build_path(JAVASCRIPT_EXTENSION),
      build_path(CSS_EXTENSION)
    )
  end

  def version
    @version ||= build_version_string(Time.now.utc)
  end

  def time
    @time ||= begin
      Time.new(*version.split(VERSION_PART_SEPARATOR).map(&:to_i)).utc
    end
  end

private

  VERSION_PART_SEPARATOR = '-'.freeze

  def build_version_string(time)
    %i[year month day hour min sec]
      .map { |time_part| time.send(time_part).to_s.rjust(2, '0') }
      .join(VERSION_PART_SEPARATOR)
  end

  def build_path(extension)
    "#{RELEASES_PATH}/#{version}/#{APP_NAME}.#{extension}"
  end

end
