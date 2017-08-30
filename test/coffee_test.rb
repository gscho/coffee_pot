require File.expand_path '../test_helper.rb', __FILE__

class CoffeeTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
  end

  def test_401
    get '/api/devices'
    assert_equal 401, last_response.status
    assert_equal 'Unable to authenticate!', last_response.body
  end

  def test_200
    header 'token', ENV['SLACK_API_TOKEN']
    get '/api/devices'
    assert_equal 200, last_response.status
    assert_equal '', last_response.body
  end

end
