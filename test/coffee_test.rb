require File.expand_path '../test_helper.rb', __FILE__

class CoffeeTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
  end

  def test_signup
    get '/signup'
    assert last_response.ok?
  end

  def test_login
    get '/login'
    assert last_response.ok?
  end

  def test_login
    get '/login'
    assert last_response.ok?
  end

  def test_post_user_error
    post '/user', 'name' => 'Tester', 'email' => 'test@email.com', 'password' => 'test1234'
    assert_equal 302, last_response.status
  end
end
