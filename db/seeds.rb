require('pry')
require_relative('../models/artist')
require_relative('../models/product')

Artist.delete_all()

artist1 = Artist.new({
  'first_name' => 'Claude',
  'last_name' => 'Monet'
})

artist2 = Artist.new({
  'first_name' => 'Pablo',
  'last_name' => 'Picasso'
})

artist1.save()
artist2.save()

product1 = Product.new({
  'title' => 'Water Lilies',
  'description' => 'Print on gloss paper with card mount, 20cm x 35cm',
  'artist_id' => artist1.id(),
  'buying_cost' => 559,
  'sale_price' => 1299,
  'copies_in_stock' => 5
})

product2 = Product.new({
  'title' => 'Guernica',
  'description' => 'Print on canvas with pine stretcher, 50cm x 20cm',
  'artist_id' => artist2.id(),
  'buying_cost' => 1535,
  'sale_price' => 2999,
  'copies_in_stock' => 2
})

product1.save()
product2.save()

binding.pry
nil
