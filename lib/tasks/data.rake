require 'fastimage'
require 'yaml'

namespace :data do
  task update_images: :environment do
    Dir[Rails.root.join('db', 'data', '*')].each do |file_name|
      day = YAML.load_file file_name
      puts day[:number]
      if day[:photos]
        day[:photos].each(&method(:append_dimensions))
        File.write file_name, YAML.dump(day)
      end
    end
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
