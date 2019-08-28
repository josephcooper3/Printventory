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
      'buying_cost' => 559,
      'sale_price' => 1299,
      'copies_in_stock' => 5,
      'image_ref' => 'waterlilies.jpg'
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
    assert_equal(559, @product1.buying_cost())
  end

  def test_can_change_buying_cost
    @product1.buying_cost = 623
    assert_equal(623, @product1.buying_cost())
  end

  def test_product_has_sale_price
    assert_equal(1299, @product1.sale_price())
  end

  def test_can_change_sale_price
    @product1.sale_price = 1450
    assert_equal(1450, @product1.sale_price())
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

  def test_product_has_image_ref
    assert_equal('waterlilies.jpg', @product1.image_ref())
  end

  def test_can_change_image_ref
    @product1.image_ref = 'lilies.png'
    assert_equal('lilies.png', @product1.image_ref())
  end

  def test_stock_status_low_stock
    @product1.copies_in_stock = 1
    assert_equal("low-stock", @product1.stock_status())
  end

  def test_stock_status_out_of_stock
    @product1.copies_in_stock = 0
    assert_equal("out-of-stock", @product1.stock_status())
  end

  def test_convert_to_pounds__buying_cost
    result = Product.convert_to_pounds(@product1.buying_cost())
    assert_equal(result, "5.59")
  end

  def test_convert_to_pounds__sale_price
    result = Product.convert_to_pounds(@product1.sale_price())
    assert_equal(result, "12.99")
  end

  def test_convert_to_pence__buying_cost
    @product1.buying_cost = Product.convert_to_pence("9.99")
    assert_equal(999, @product1.buying_cost)
  end

  def test_convert_to_pence__sale_price
    @product1.sale_price = Product.convert_to_pence("14.99")
    assert_equal(1499, @product1.sale_price())
  end

end
