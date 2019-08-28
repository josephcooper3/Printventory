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

artist3 = Artist.new({
  'first_name' => 'Henry',
  'last_name' => 'Raeburn'
})

artist4 = Artist.new({
  'first_name' => 'Edwin',
  'last_name' => 'Landseer'
})

artist5 = Artist.new({
  'first_name' => 'Thomas',
  'last_name' => 'Gainsborough'
})

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()


product1 = Product.new({
  'title' => 'Cloud Study',
  'description' => 'Print on gloss paper with card mount, 20cm x 35cm',
  'artist_id' => artist1.id(),
  'buying_cost' => 559,
  'sale_price' => 1299,
  'copies_in_stock' => 5,
  'image_ref' => 'cloud_study.jpg'
})

product2 = Product.new({
  'title' => 'Hadleigh Castle',
  'description' => 'Print on canvas with pine stretcher, 50cm x 40cm',
  'artist_id' => artist1.id(),
  'buying_cost' => 1535,
  'sale_price' => 2999,
  'copies_in_stock' => 2,
  'image_ref' => 'hadleigh_castle.jpg'
})

product3 = Product.new({
  'title' => 'Tummel Bridge, Perthshire',
  'description' => 'Print on matte paper with card mount, 20cm x 35cm',
  'artist_id' => artist2.id(),
  'buying_cost' => 615,
  'sale_price' => 1350,
  'copies_in_stock' => 0,
  'image_ref' => 'tummel_bridge.jpg'
})

product4 = Product.new({
  'title' => 'Fire in London, Seen from Hampstead',
  'description' => 'Colour print on gloss card, 9.5 x 15.2 cm',
  'artist_id' => artist1.id(),
  'buying_cost' => 305,
  'sale_price' => 599,
  'copies_in_stock' => 7,
  'image_ref' => 'fire_in_london.jpg'
})

product5 = Product.new({
  'title' => 'Wooded Landscape with a Cottage and Shepherd',
  'description' => 'Landscape print, mounted on wooden board',
  'artist_id' => artist5.id(),
  'buying_cost' => 710,
  'sale_price' => 1150,
  'copies_in_stock' => 11,
  'image_ref' => 'wooded_landscape.jpg'
})

product6 = Product.new({
  'title' => 'A Highland Landscape',
  'description' => 'Print on canvas with pine stretcher, 20.3 x 25.4 cm',
  'artist_id' => artist4.id(),
  'buying_cost' => 1299,
  'sale_price' => 1750,
  'copies_in_stock' => 2,
  'image_ref' => 'highland_landscape.jpg'
})

product7 = Product.new({
  'title' => 'An Irish Wolfhound',
  'description' => 'Colour print with plain background on cream paper, 16.7 × 26.4 cm',
  'artist_id' => artist4.id(),
  'buying_cost' => 265,
  'sale_price' => 659,
  'copies_in_stock' => 7,
  'image_ref' => 'irish_wolfhound.jpg'
})

product8 = Product.new({
  'title' => 'Sheep Dog Sleeping',
  'description' => 'Black and white print on beige paper, 7.9 × 17.8 cm',
  'artist_id' => artist4.id(),
  'buying_cost' => 157,
  'sale_price' => 499,
  'copies_in_stock' => 12,
  'image_ref' => 'sheep_dog_sleeping.jpg'
})

product9 = Product.new({
  'title' => 'Sir Walter Scott',
  'description' => 'Black and white print, 30cm x 25cm',
  'artist_id' => artist3.id(),
  'buying_cost' => 399,
  'sale_price' => 650,
  'copies_in_stock' => 0,
  'image_ref' => 'sir_walter_scott.jpg'
})

product10 = Product.new({
  'title' => 'Dugald Stewart Esq.',
  'description' => 'Black and white print on cream paper, 38.1 × 28.9 ',
  'artist_id' => artist3.id(),
  'buying_cost' => 679,
  'sale_price' => 999,
  'copies_in_stock' => 5,
  'image_ref' => 'dugald_stewart.jpg'
})

product1.save()
product2.save()
product3.save()
product4.save()
product5.save()
product6.save()
product7.save()
product8.save()
product9.save()
product10.save()
