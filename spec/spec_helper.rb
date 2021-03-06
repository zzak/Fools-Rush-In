ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'minitest/spec'
require 'sinatra/test_helpers'

require File.expand_path '../../app', __FILE__

class Minitest::Spec
  include Sinatra::TestHelpers

  def app
    Sinatra::Application
  end

  def body
    last_response.body.gsub(/\n/,'')
  end

  def ok?
    last_response.ok?
  end

  def content_type
    last_response.headers['Content-Type']
  end

end
