require 'erb'
require 'sinatra'
require 'sinatra/reloader' if development?

before do
  @app = File.read __FILE__
end

get '/' do
  erb :index
end

get '/style.css' do
  erb :css, :content_type => 'text/css', :layout => false
end

get '/app.js' do
  erb :js, :content_type => 'text/javascript', :layout => false
end

get '/:username' do
  erb :profile
end

__END__

@@ layout
<!DOCTYPE html>
<html>
  <head>
    <title>Fools Rush In</title>
    <link rel="stylesheet" type="text/css" href="/style.css" />
  </head>
  <body>
    <h1><a href="/">Fools Rush In</a></h1>

    <p>This application is designed to showcase some of the most basic features
    <a href="http://sinatrarb.com/">Sinatra</a> offers.</p>

    <p>At the bottom of this page you can view the full source of this application.</p>

    <div id="content"><%= yield %></div>

    <pre><code><%= ERB::Util.h @app %></code></pre>
  </body>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script src="/app.js"></script>
</html>

@@ index
<form id="fools_rush_in" action="/" method="get">
  <input placeholder="Enter a username" type="text" name="username" />
  <input type="submit" value="Check it" />
</form>

@@ profile
<h2>Hello, <%= params[:username] %>!</h2>

@@ js
$(document).ready(function() {
  $("form#fools_rush_in").submit(function(event) {
    var username = $(this).find('input[name=username]').val();
    if (username.length > 0) {
      window.location = "/" + username;
    }
    return false;
  });
});

@@ css
body {
  font-family: 'Lucida Grande', Verdana, sans-serif;
  margin: 10px auto;
  max-width: 976px;
  line-height: 1.25em; }

h1, h2, h3, h4, h5 {
  font-family: Georgia, 'bitstream vera serif', serif;
  margin: 40px 0 20px 0;
  line-height: 1.5em; }

a:link, a:visited { color: #3F3F3F; }

a:hover, a:active { color: #8F8F8F; }

#content {
  background: #333;
  color: #EEE;
  padding: 50px; }

form { text-align: center; }

input {
  padding: 5px;
  font-size: 15px; }

code, pre, tt {
  font-family: 'Monaco', 'Menlo', consolas, inconsolata, monospace;
  font-size: 0.85em;
  border: 1px solid #cccccc;
  border-radius: 3px;
  background: #fafafa;
  padding: 1px 2px; }

pre {
  line-height: 1.6em;
  padding: 5px 20px;
  overflow: auto;
  overflow-Y: hidden; }
