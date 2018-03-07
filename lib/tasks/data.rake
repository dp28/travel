require 'fastimage'
require 'yaml'

namespace :data do
  task update_images: :environment do
    day_files.each do |file_name|
      day = YAML.load_file file_name
      puts day[:number]
      if day[:photos]
        day[:photos].each(&method(:append_dimensions))
        File.write file_name, YAML.dump(day)
      end
    end
  end

  task create_next_day: :environment do
    last_day_file_path = day_files.last
    next_day = YAML.load_file last_day_file_path
    next_day[:number] += 1
    next_day[:date] = (Date.parse(next_day[:date]) + 1).to_s
    next_day[:written] = "#{Date.today} #{stub_text}"
    next_day[:entry] = "|2\n#{stub_text}"
    next_day[:stats][:walked] = stub_text
    next_file_path = last_day_file_path.gsub(
      to_file_name(next_day[:number] - 1),
      to_file_name(next_day[:number]
    )
    File.write next_file_path, YAML.dump(next_day)
    puts "Created stub day file at #{next_file_path}"
  end

  def day_files
    Dir[Rails.root.join('db', 'data', '*')].sort
  end

  def stub_text
    'FILL THIS IN'
  end

  def to_file_name(day_number)
    day_number.to_s.rjust 3, '0'
  end

  def append_dimensions(photo_config)
    return if (photo_config[:width] && photo_config[:height]) || !photo_config[:url]
    dimensions = attempt_fetch_dimensions photo_config[:url]
    return unless dimensions
    photo_config[:width] = dimensions.first
    photo_config[:height] = dimensions.second
  rescue TypeError
    puts 'Photos is just an array of strings - skipping'
  end

  def attempt_fetch_dimensions(image_url)
    dimensions = fetch_dimensions image_url
    if dimensions
      print '.'
      dimensions
    else
      puts "Failed to fetch dimensions for #{image_url} - skipping"
      nil
    end
  end

  def fetch_dimensions(image_url, try_number: 3)
    return nil if try_number.zero?
    dimensions = FastImage.size(image_url, timeout: 10)
    dimensions || fetch_dimensions(image_url, try_number: try_number - 1)
  end
end
