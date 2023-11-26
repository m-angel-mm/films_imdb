# frozen_string_literal: true

# Filter IPs
class FilterIp
  IPS = %w[192.168.0.199 192.168.0.249].freeze
  def initialize(app)
    @app = app
  end

  def call(env)
    req = Rack::Request.new(env)
    if IPS.include?(req.ip)
      [403, {}, '']
    else
      @app.call(env)
    end
  end
end
