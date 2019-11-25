seed_file = Rails.root.join('db', 'seeds', 'artists.yml')
seed_artists = YAML.load_file(File.open(seed_file, 'r'))
Spotify::ImportData.new.find_info_artist(seed_artists)
