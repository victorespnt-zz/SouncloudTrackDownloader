require "soundcloud"
require "awesome_print"
require "soundcloud-downloader"
require_relative('client.rb')
require_relative('view.rb')
require_relative('track.rb')
require_relative('artist.rb')

class Main
  def self.run
    view = View.new

    view.print_welcome
    name = view.ask_for_artist_name()
    artist = CLIENT.get_artist(name)
    tracks = CLIENT.get_tracks(artist)
    view.display_tracks(artist, tracks)
    trackindex = view.get_track_index()
    track = tracks[trackindex]
    title = track['title']
    streamurl = track['stream_url']
    CLIENT.download_sound(title, streamurl)
    view.print_congrats
  end

end

Main.run()