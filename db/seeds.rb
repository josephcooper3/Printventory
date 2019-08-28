require('pry')
require_relative('../models/artist')
require_relative('../models/product')

Artist.delete_all()

artist1 = Artist.new({
  'first_name' => 'John',
  'last_name' => 'Constable'
})

artist2 = Artist.new({
  'first_name' => 'JMW',
  'last_name' => 'Turner'
})

artist1.save()
artist2.save()

product1 = Product.new({
  'title' => 'Cloud Study',
  'description' => 'Print on gloss paper with card mount, 20cm x 35cm',
  'artist_id' => artist1.id(),
  'buying_cost' => 559,
  'sale_price' => 1299,
  'copies_in_stock' => 5,
  'image_ref' => 'cloudstudy.jpg'
})

product2 = Product.new({
  'title' => 'Hadleigh Castle',
  'description' => 'Print on canvas with pine stretcher, 50cm x 40cm',
  'artist_id' => artist1.id(),
  'buying_cost' => 1535,
  'sale_price' => 2999,
  'copies_in_stock' => 2,
  'image_ref' => 'hadleighcastle.jpg'
})

product3 = Product.new({
  'title' => 'Tummel Bridge, Perthshire',
  'description' => 'Print on matte paper with card mount, 20cm x 35cm',
  'artist_id' => artist2.id(),
  'buying_cost' => 615,
  'sale_price' => 1350,
  'copies_in_stock' => 0,
  'image_ref' => 'tummelbridge.jpg'
})

product1.save()
product2.save()
product3.save()

binding.pry
nil
