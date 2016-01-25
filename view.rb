class View

	def initialize
	end

	def print_welcome
		puts "--- SoundCloud Downloader ---"
	end

	def print_congrats
		print "\n"
		puts "--- Congrats ---"
	end


	def ask_for_artist_name
		puts "Enter an artist name"
		print "> "
		gets.chomp
	end

	def get_track_index
		puts "Choose a track number"
		print "> "
		gets.chomp.to_i
	end


	def display_tracks(artist, tracks)
		puts "--- #{artist["full_name"]}'s TRACKS ---"
		print "\n"

		tracks.each_with_index do |track, index|
			puts "#{index} - #{track["title"]}"
		end
	end
	# ...
end