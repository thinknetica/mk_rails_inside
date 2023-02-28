class ResponseTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    [200, {"content-type" => "text/html"}, ["Hello, Timer!"]]
    # [200, {"content-type" => "application/json"}, ["{\"message\":\"Hello World!\"}"]]
    # @app.call(env)
  end
end

class App
  def call(env)
    [200, {}, ["#{env['PATH_INFO']}"]]
  end
end

# run Proc.new { |env| [200, {}, ["Hello, Proc World!"]] }
# run lambda { |env| [200, {}, ["Hello, Lambda World!"]] }
# run { |env| [200, {}, ["Hello, Block World!"]] }

use ResponseTimer
run App.new

# app = Rack::URLMap.new(
#   '/hello' => Proc.new { |env| [200, {}, ["Hello path!"]] },
#     '/bye'   => Proc.new { |env| [200, {}, ["Bye path"]] }
# )
# run app

# map "/" do
#   run App.new
# end
# map "/status" do
#   run Proc.new { |env| [200, {}, ["Hello, Status page!"]] }
# end