# EventLogger
EventLogger is an engine which can help you to track steps of your application and to track exceptions. It supports several hosts.

## Note
This engine used only in several cases for close projects. I strongly recommend you not to use it in your rails app.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'event_logger', github: "tutelaris/event_logger"
```

And then execute:
```bash
$ bundle install
```
Copy migrations using:
```bash
$ rails event_logger:install:migrations
```

Create initializer `config/initializers/event_logger.rb`:
```ruby
module MyEventLogger
  def self.event_logger
    @event_logger ||= EventLogger::Logger.new
  end
end
```

Add routes to your `config/routes.rb`:
```ruby
MyEventLogger::Application.routes.draw do
  # your routes
  # ...
  mount_event_logger_at "/admin/event_logger"
end
```

## Usage
Modify your method like this:
```ruby
def new_coctail
  MyEventLogging.event_logger.log("localhost:3000", :new_coctail) do
    @vodka = Vodka.new
    @topping = Topping.new
    if @client.drives_car?
      fail "You better stay sober"
    end
  end
end
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
