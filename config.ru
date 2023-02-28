class App
  def call(env)
    [200, {"content-type" => "application/json"}, ["{\"message\":\"Hello World!\"}"]]
  end
end

class Intercepter
  def initialize(app)
    @app = app
  end

  def call(env)
    if user_authenticated?(env)
      @app.call(env)
    else
      [401, {}, ["Authentication required"]]
    end
  end

  def user_authenticated?(env)
    true
  end
end

use Intercepter
run App.new