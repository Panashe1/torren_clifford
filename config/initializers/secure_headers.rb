SecureHeaders::Configuration.default do |config|
  config.x_frame_options = "SAMEORIGIN"
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = "1; mode=block"
  config.referrer_policy = %w[strict-origin-when-cross-origin]

  # HSTS — only meaningful over HTTPS (production). Harmless locally.
  config.hsts = "max-age=#{1.year.to_i}; includeSubDomains; preload"

  config.csp = {
    default_src: %w['self'],
    img_src:     %w['self' data: https://images.unsplash.com],
    # 'unsafe_inline' is required because the views use inline <style>/<script>.
    # When you add a payment gateway (e.g. Stripe), add its domains here, e.g.:
    #   script_src: %w['self' 'unsafe-inline' https://js.stripe.com]
    #   frame_src:  %w[https://js.stripe.com https://hooks.stripe.com]
    script_src:  %w['self' 'unsafe-inline'],
    style_src:   %w['self' 'unsafe-inline'],
    font_src:    %w['self' data:],
    connect_src: %w['self'],
    object_src:  %w['none'],
    base_uri:    %w['self'],
    form_action: %w['self']
  }
end
