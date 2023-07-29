Talk through search form methods
Route parameters
is webrick a web server or application server? are they separate?

Section 23.
Talk about todo list method for keeping track of how many completed "3/4".


# What is rack?

WEBrick acts as an application server.

Rack provides an interface for a rack based ruby web application (like sianatra, rails)
and the application server (WEBrick).

Requests first go through the web server (could be something like apache), then
through the app server (WEBrick). Rack then takes these plain text HTTP requests and
formats them into a ruby data structures that the ruby program can work with, which
is a hash called `env`, containing all the information about the request. The
application defines a `call` method that takes this env hash as an argument. Rack
then takes the return value of that call method and formats it into text that will be sent back as the HTTP response which goes back through the web server then to the client.

The purpose of rack is to handle HTTP requests/responses, allowing the application
to focus on logic/content/server-side changes.

Rack handlers connect rack with web servers.

# What makes an app rack-based?

The app adheres to rack-based specifications, particularly the app must define
a `call` method that defines one parameter called `env`. The method returns
an `array object` containing 3 things:
* Status code represented by a string or integer.
* Hash object containing content headers and their values.
* An object that responds to `enumerable#each`, holds the body of the response.

The argument passed to the call method is bound to the `env` parameter as a hash
object with HTTP headers and other **env**ironment variables related to the
incoming request. Rack uses the return value (array) to format an HTTP response
that will be sent back to the client.

Basic rack app:
```ruby
require 'rack'
class MyApp
  def call(env)
    ['200', { "Content-Type" => "text/plain" }, ["hello world"]]
  end
endRack::Handler::WEBrick.run MyApp.new
```

# Rack middleware

Allows develoeprs to add many functionalities to their application such as logging,
authentication, stopping spam, etc.

Example: Here middlewares are extracted into a config.ru file
```ruby
#myapp.rb
require 'rack'
class MyApp
  def call(env)
    ['200', { "Content-Type" => "text/plain" }, ["hello world"]]
  end
end

class FriendlyGreeting
  def initialize(app)
    @app = app
  end

  def call(env)
    body = @app.call(env).last    [
      '200',
      { "Content-Type" => "text/plain" },
      body.prepend("A warm welcome to you!\n")
    ]
  end
end

class Wave
  def initialize(app)
    @app = app
  end

  def call(env)
    body = @app.call(env).last    [
     '200',
     { "Content-Type" => "text/plain" },
     body.prepend("Wave from afar!\n")
    ]
  end
end

#config.ru
require_relative "myapp"
use Wave
use FriendlyGreetingrun

MyApp.new
```
# View Templates

View templates are separate files that allow us to store and maintain code
related to what we want to display. They allow us to do pre-processing on the
server side in a language such as ruby and then translate that code into a string
(html) that will be returned to the client as part of the http response. Basically
templates are files that contain text (strings) that is converted into HTML and
sent as a response to a client.

# Embedded ruby (ERB)

Allows us to embed ruby directly into html and the result is a 100% html string.
`<%= &>` syntax allows us to insert ruby code into html. it will evaluate the code
and include the codes return value in the HTML output. `<% %>` will only
evaluate the ruby code but not include the return value in the output.
```ruby
# if this was in an .erb file:
<% names = ['bob', 'joe', 'kim', 'jill'] %><html>
  <body>
    <h4>Hello, my name is <%= names.sample %></h4>
  </body>
</html>

# we could retreive the 100% html string in the same way from another file like:
require 'erb'
template_file = File.read('example.erb')
erb = ERB.new(template_file)
erb.result

# used in an http response like this:
# hello_world.rb
class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      template = File.read("views/index.erb")
      content = ERB.new(template)
      ['200', {"Content-Type" => "text/html"}, [content.result]]
    when '/advice'
      piece_of_advice = Advice.new.generate
      [
        '200',
        {"Content-Type" => 'text/html'},
        ["<html><body><b><em>#{piece_of_advice}</em></b></body></html>"]
      ]
    else
      [
        '404',
        {"Content-Type" => 'text/html', "Content-Length" => '48'},
        ["<html><body><h4>404 Not Found</h4></body></html>"]
      ]
    end
  end
end
```
# Layouts

Layouts are view templates that wrap around other view templates to reduce
repetitious code. For example:
```ruby
# this html:
<html>
  <head>
    <title>Is it your birthday?</title>
  </head>
  <body>
    <p>Yes, it is!</p>
  </body>
</html>

# could be broken up into a layout like:
<html>
  <head>
    <title>Is it your birthday?</title>
  </head>
  <body>
    <%= yield %>
  </body>
</html>

# yield is used in a layout to indicate where content from the view templates
# will show up.

# in this example:
get '/' do
  erb :index, layout: :post
end
# sinatra looks for a layout called post.erb in the views directory and wraps
# it inside the index.erb template

# layout.erb is used by default if no layout is specified
get '/' do
  erb :index # layout.erb is used by default
end
```

`view helpers` are methods that are made available in templates by Sinatra for the purpose of filtering data, processing data, or performing some other functionality.
```ruby
# methods defined in the block of the helpers method are intended
# to be used for views

helpers do
  def slugify(text)
    text.downcase.gsub(/\s+/, "-").gsub(/[^\w-]/, "")
  end
end
```