require('pry')
require_relative('../models/artist')

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

binding.pry
nil
