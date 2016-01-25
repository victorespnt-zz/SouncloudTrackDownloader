require "soundcloud"
require "awesome_print"
require "soundcloud-downloader"

CLIENT_ID = "52c68972691d7085a0b7f83935a49750"
CLIENT_SECRET = "a68668f96f3c529f76f31ca37cc59f7f"
CLIENT = SoundCloud.new({ client_id: CLIENT_ID, client_secret: CLIENT_SECRET })

def search_artist(name)
  CLIENT.get('/users', q: name).first
end

def search_tracks(artist)
  id = artist["id"]
  CLIENT.get("/users/#{id}/tracks")
end

def download_sound(title, url)
  downloader = SoundCloud::Downloader::Client.new(client_id: CLIENT_ID, path: 'downloads')
  downloader.download(url, { file_name: title, display_progress: true })
end

def ask_for_artist
  puts "Enter an artist name"
  print "> "
  gets.chomp
end

def display_tracks(artist, tracks)
  puts "--- #{artist["full_name"]}'s TRACKS ---"
  print "\n"

  tracks.each_with_index do |track, index|
    puts "#{index} - #{track["title"]}"
  end
end

def get_track_index
  puts "Choose a track number"
  print "> "
  gets.chomp.to_i
end

puts "--- SoundCloud Downloader ---"

print "\n"

artist = search_artist(ask_for_artist)
tracks = search_tracks(artist)

print "\n"

display_tracks(artist, tracks)

puts "----------------------------------"
print "\n"

track = tracks[get_track_index]

ap track
track_url = track["stream_url"]


download_sound(track["title"], track_url)

print "\n\n"

puts "#{track["title"]} has been downloaded successfuly !"