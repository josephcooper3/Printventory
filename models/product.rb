class Product

  attr_reader :id
  attr_accessor :title

  def initialize(options)
    @id = options['id'] if options['id']
    @title = options['title']
  end

end
