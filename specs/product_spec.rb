require('minitest/autorun')
require('minitest/rg')
require_relative('../models/product')

class ProductTest < MiniTest::Test

  def setup
    @product1 = Product.new({
      'id' => 1,
      'title' => 'Water Lilies',
      'description' => 'Print on gloss paper with card mount, 20cm x 35cm',
      'artist_id' => 2,
      'buying_cost' => 5.59,
      'sale_price' => 12.99,
      'copies_in_stock' => 5
      })
  end

  def test_product_has_id
    assert_equal(1, @product1.id())
  end

  def test_product_has_title
    assert_equal('Water Lilies', @product1.title())
  end

  def test_product_has_description
    description = 'Print on gloss paper with card mount, 20cm x 35cm'
    assert_equal(description, @product1.description())
  end

  def test_product_has_artist_id
    assert_equal(2, @product1.artist_id())
  end

  def test_product_has_buying_cost
    assert_equal(5.59, @product1.buying_cost())
  end

  def test_product_has_sale_price
    assert_equal(12.99, @product1.sale_price())
  end

  def test_product_has_copies_in_stock
    assert_equal(5, @product1.copies_in_stock())
  end

end
