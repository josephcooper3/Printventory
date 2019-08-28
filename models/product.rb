require_relative('../db/sqlrunner')
require('pry')

class Product

  attr_reader :id
  attr_accessor :title, :description, :artist_id, :buying_cost, :sale_price, :copies_in_stock, :image_ref

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @description = options['description']
    @artist_id = options['artist_id'].to_i
    @buying_cost = options['buying_cost'].to_i
    @sale_price = options['sale_price'].to_i
    @copies_in_stock = options['copies_in_stock'].to_i
    @image_ref = options['image_ref']
  end

  def save()
    sql = "INSERT INTO products (
    title,
    description,
    artist_id,
    buying_cost,
    sale_price,
    copies_in_stock,
    image_ref
    )
    VALUES
    ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id"
    values = [@title, @description, @artist_id, @buying_cost, @sale_price, @copies_in_stock, @image_ref]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.map_results(results)
    results.map { |result| Product.new(result) }
  end

  def self.all()
    sql = "SELECT * FROM products
    ORDER BY title"
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
    copies_in_stock,
    image_ref
    )
    = ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8
    "
    values = [@title, @description, @artist_id, @buying_cost, @sale_price, @copies_in_stock, @image_ref, @id]
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

  def self.convert_to_pounds(amount)
    pounds = (amount / 100).to_s
    pence = (amount % 100).to_s
    pence = "0" + pence if pence.length == 1
    return "#{pounds}.#{pence}"
  end

  def self.convert_to_pence(amount)
    amount = amount.to_s
    amount = amount.split('.')
    pounds = amount[0].to_i * 100
    pence = amount[1].to_i
    return pounds + pence
  end

end
