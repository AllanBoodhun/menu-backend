if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_menu-api', domain: 'menu-ap-json-api'
else
  Rails.application.config.session_store :cookie_store, key: '_menu-api'
end
