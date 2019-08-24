class Product

  attr_reader :id
  attr_accessor :title, :description, :artist_id, :buying_cost

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @description = options['description']
    @artist_id = options['artist_id'].to_i
    @buying_cost = options['buying_cost'].to_f
  end

end
