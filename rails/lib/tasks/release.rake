namespace :release do
  task generate_files: :environment do
    raise 'Only possible with RAILS_ENV=production' unless Rails.env.production?
    release = Release.new(description: 'Some awesome new features')
    compile_frontend release
    store_release release
  end

  task edit_doc: :environment do
    release = load_most_recent_release
    file_path = [
      ReleaseRepository::ROOT_RELEASE_DIRECTORY_PATH,
      release.version,
      ReleaseRepository::DESCRIPTION_FILE_NAME
    ].join '/'

    puts "Please describe the new release in #{file_path}"
    `subl -w #{file_path}`
  end

  task commit: :environment do
    release = load_most_recent_release
    message = "Release #{release.version}"
    [
      'add .',
      "commit -am '#{message}'",
      "tag -a #{release.version} -m '#{message}'"
    ].all? do |command|
      `git #{command}`
    end
  end

  task :push do
    puts 'Pushing to Heroku and GitHub'
    `git push heroku master && git push origin master --follow-tags`
  end

  task :migrate do
    `heroku run rake db:migrate`
  end

  task :seed do
    `heroku run rake db:seed`
  end

  task frontend: %i[generate_files edit_doc commit push] do
    puts 'Finished'
  end

  task api: %i[push migrate seed] do
    puts 'Finished'
  end

  task full: %i[generate_files edit_doc commit push migrate seed] do
    puts 'Finished'
  end
end

def compile_frontend(release)
  puts 'Compiling frontend files ...'
  puts `RELEASE_VERSION=#{release.version} ./bin/webpack`
  puts "  - ./public#{release.links.javascript}"
  puts "  - ./public#{release.links.css}"
end

def store_release(release)
  puts 'Creating release metadata ...'
  ReleaseRepository.store(release)
  description_path = [
    ReleaseRepository::ROOT_RELEASE_DIRECTORY_PATH,
    release.version,
    ReleaseRepository::DESCRIPTION_FILE_NAME
  ].join '/'
  puts "  - #{description_path}"
end

def load_most_recent_release
  ReleaseRepository.search.first
end
