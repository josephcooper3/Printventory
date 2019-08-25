require_relative('../db/sqlrunner')

class Artist

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO artists (
    first_name,
    last_name)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.map_results(results)
    results.map { |result| Artist.new(result) }
  end

  def self.all()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    map_results(result)
  end

  def update
    sql = "UPDATE artists SET
    (first_name, last_name)
    = ($1, $2)
    WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Artist.new(result)
  end

end
