class Product

  attr_reader :id
  attr_accessor :title, :description, :artist_id, :buying_cost, :sale_price, :copies_in_stock

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @description = options['description']
    @artist_id = options['artist_id'].to_i
    @buying_cost = options['buying_cost'].to_f
    @sale_price = options['sale_price'].to_f
    @copies_in_stock = options['copies_in_stock'].to_i
  end

  def save()
    sql = "INSERT INTO products (
    title,
    description,
    artist_id,
    buying_cost,
    sale_price,
    copies_in_stock
    )
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@title, @description, @artist_id, @buying_cost, @sale_price, @copies_in_stock]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end


end
