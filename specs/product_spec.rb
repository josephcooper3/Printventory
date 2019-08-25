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

  def test_can_change_product_title
    @product1.title = 'Haystacks'
    assert_equal('Haystacks', @product1.title)
  end

  def test_product_has_description
    description = 'Print on gloss paper with card mount, 20cm x 35cm'
    assert_equal(description, @product1.description())
  end

  def test_can_change_product_description
    @product1.description = 'Print on canvas, 30cm x 50cm'
    assert_equal('Print on canvas, 30cm x 50cm', @product1.description())
  end

  def test_product_has_artist_id
    assert_equal(2, @product1.artist_id())
  end

  def test_can_change_artist_id
    @product1.artist_id = 3
    assert_equal(3, @product1.artist_id())
  end

  def test_product_has_buying_cost
    assert_equal(5.59, @product1.buying_cost())
  end

  def test_can_change_buying_cost
    @product1.buying_cost = 6.23
    assert_equal(6.23, @product1.buying_cost())
  end

  def test_product_has_sale_price
    assert_equal(12.99, @product1.sale_price())
  end

  def test_can_change_sale_price
    @product1.sale_price = 14.50
    assert_equal(14.50, @product1.sale_price())
  end

  def test_product_has_copies_in_stock
    assert_equal(5, @product1.copies_in_stock())
  end

  def test_can_increase_copies_in_stock
    @product1.copies_in_stock += 1
    assert_equal(6, @product1.copies_in_stock())
  end

  def test_can_decrease_copies_in_stock
    @product1.copies_in_stock -= 1
    assert_equal(4, @product1.copies_in_stock())
  end

end
