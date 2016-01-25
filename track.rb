class Track
  # ...

  def initialize(data)
    
    @downloader = SoundCloud::Downloader::Client.new(client_id: CLIENT.client_id, path: 'downloads')
  end

  def download!
    # Download the file
  end

  # ...
end