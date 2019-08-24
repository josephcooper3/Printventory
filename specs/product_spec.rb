require('minitest/autorun')
require('minitest/rg')
require_relative('../models/product')

class ProductTest < MiniTest::Test

  def setup
    @product1 = Product.new({
      'id' => 1,
      'title' => 'Water Lilies'
      })
  end

  def test_product_has_id
    assert_equal(1, @product1.id())
  end

end
