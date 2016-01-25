class Client
  attr_reader :client_id

  def initialize
    @client_id = "52c68972691d7085a0b7f83935a49750"
    @client_secret = "a68668f96f3c529f76f31ca37cc59f7f"
    @client = SoundCloud.new({ client_id: @client_id, client_secret: @client_secret })
  end

  def get_artist(name)	
  	@client.get('/users', q: name).first 	
  end

	def get_tracks(artist)	
		id = artist["id"]
		@client.get("/users/#{id}/tracks")
	end

	def download_sound(title, url)
		downloader = SoundCloud::Downloader::Client.new(client_id: @client_id, path: 'downloads')
		downloader.download(url, { file_name: title, display_progress: true })
	end



  # methode pour chercher 	des artistes, methode pour chercher des tracks, ...
end

# En majuscule = Constante = Accessible globalement
CLIENT = Client.new