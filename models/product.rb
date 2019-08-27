require_relative('../db/sqlrunner')

class Product

  attr_reader :id
  attr_accessor :title, :description, :artist_id, :buying_cost, :sale_price, :copies_in_stock

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @description = options['description']
    @artist_id = options['artist_id'].to_i
    @buying_cost = options['buying_cost'].to_i
    @sale_price = options['sale_price'].to_i
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

  def self.map_results(results)
    results.map { |result| Product.new(result) }
  end

  def self.all()
    sql = "SELECT * FROM products"
    result = SqlRunner.run(sql)
    map_results(result)
  end

  def update()
    sql = "UPDATE products SET (
    title,
    description,
    artist_id,
    buying_cost,
    sale_price,
    copies_in_stock
    )
    = ($1, $2, $3, $4, $5, $6)
    WHERE id = $7
    "
    values = [@title, @description, @artist_id, @buying_cost, @sale_price, @copies_in_stock, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Product.new(result)
  end

  def stock_status()
    if @copies_in_stock == 0
      return "out-of-stock"
    elsif @copies_in_stock < 3
      return "low-stock"
    end
  end

end
