require('pry')
require_relative('../models/artist')

Artist.delete_all()

artist1 = Artist.new({
  'first_name' => 'Claude',
  'last_name' => 'Monet'
})

artist1.save()

binding.pry
nil
