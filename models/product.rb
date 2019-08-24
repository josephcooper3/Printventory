class Product

  attr_reader :id
  attr_accessor :title, :description

  def initialize(options)
    @id = options['id'] if options['id']
    @title = options['title']
    @description = options['description']
  end

end
