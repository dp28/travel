# Doesn't inherit from ApplicationRecord because it isn't database-backed
class Release

  attr_reader :description, :links

  Links = Struct.new(:javascript, :css)

  def initialize(description:, javascript:, css:, version: nil)
    @version = version
    @description = description
    @links = Links.new(javascript, css)
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

end
