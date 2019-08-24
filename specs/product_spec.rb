require('minitest/autorun')
require('minitest/rg')
require_relative('../models/product')

class ProductTest < MiniTest::Test

  def setup
    @product1 = Product.new({
      'id' => 1,
      'title' => 'Water Lilies',
      'description' => 'Print on gloss paper with card mount, 20cm x 35cm'
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

end
