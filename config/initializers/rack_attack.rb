class Rack::Attack
  # Throttle all requests by IP (300 requests per 5 minutes)
  throttle("req/ip", limit: 300, period: 5.minutes) do |req|
    req.ip unless req.path.start_with?("/assets")
  end

  # Throttle POST requests to login/checkout-style paths more aggressively.
  # Tighten the path match once you add real auth/payment endpoints.
  throttle("logins/ip", limit: 10, period: 1.minute) do |req|
    req.ip if req.post? && req.path =~ %r{/(login|sessions|checkout|payments)}
  end

  # Return a friendly 429 when throttled
  self.throttled_responder = lambda do |_env|
    [429, { "Content-Type" => "text/plain" }, ["Too many requests. Please retry later.\n"]]
  end
end
