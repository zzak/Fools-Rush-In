require File.expand_path '../spec_helper', __FILE__

describe Sinatra::Application do
  it "should get the root index" do
    get '/'
    assert ok?
    body.must_match /Fools Rush In/
  end

  it "should get the user profile" do
    get '/zzak'
    assert ok?
    body.must_match /Hello, zzak!/
  end

  it "should get the stylesheet" do
    get '/style.css'
    assert ok?
    content_type.must_match /text\/css/
  end

  it "should get the javascript app" do
    get '/app.js'
    assert ok?
    content_type.must_match /text\/javascript/
  end

  it "should not render the layout for css or js" do
    get '/style.css'
    body.wont_match /<html>/

    get '/app.js'
    body.wont_match /<html>/
  end

end
