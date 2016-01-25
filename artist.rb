class Artist
  # ...

  def initialize(hash_of_data_from_the_api)
    @id = data["id"]
    @full_name = data["full_name"]
    # ...
  end

  def self.find_by_name(name_of_the_artist)
    CLIENT.get("/users/#{artist["id"]}")
  end

  def tracks
    # Call the CLIENT
  end

  # ...
end
