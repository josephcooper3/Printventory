class Product

  attr_reader :id
  attr_accessor :title, :description, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @description = options['description']
    @artist_id = options['artist_id'].to_i
  end

end
