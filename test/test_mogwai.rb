require 'test/unit'
require 'mogwai'

class MogwaiTest < Test::Unit::TestCase

  def test_config 
    config = Mogwai::Config.new
    config.read

    assert_not_nil config[:AWS_ACCESS_KEY_ID]
    assert_not_nil config[:AWS_SECRET_ACCESS_KEY]
    assert_not_nil config[:AWS_BUCKET]
    assert_not_nil config[:AWS_REGION]
    assert_not_nil config[:BUILD_DIR]

    assert_equal Mogwai.deploy, true 
  end

end
