require('minitest/autorun')
require('minitest/rg')
require_relative('../models/artist')

class ArtistTest < MiniTest::Test

  def setup
    @artist1 = Artist.new({
      'id' => 1,
      'first_name' => 'Claude',
      'last_name' => 'Monet'
    })
  end

  def test_artist_has_id
    assert_equal(1, @artist1.id)
  end

  def test_artist_has_first_name
    assert_equal('Claude', @artist1.first_name())
  end

  def test_artist_has_last_name
    assert_equal('Monet', @artist1.last_name())
  end

  def test_can_change_first_name
    @artist1.first_name = 'Vincent'
    assert_equal('Vincent', @artist1.first_name())
  end

  def test_can_change_last_name
    @artist1.last_name = 'Lorrain'
    assert_equal('Lorrain', @artist1.last_name())
  end

end
