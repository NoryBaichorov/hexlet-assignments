# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      root_url = 'https://rails-collective-blog-ru.hexlet.app'
      get_url = "#{root_url}/users/sign_up"
      post_url = "#{root_url}/users"
      
      URI.open(get_url)

      http = config_http(root_url)

      cookie, body = get_cookie_and_body(get_url, http)

      params = {
        'user[email]': email,
        'user[password]': password,
        'user[password_confirmation]': password,
        authenticity_token: get_csrf_token(body)
      }

      response = create_user(post_url, params, cookie, http)

      response.code == '303' ? 'User created successfully' : "Task failed with code -> #{response.code}"
      # END
    end

    protected

    def config_http(url)
      uri = URI(url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http
    end

    def get_cookie_and_body(url, http)
      # Do GET request and set cookie
      request = Net::HTTP::Get.new(URI(url))
      response = http.request(request)

      [response.response['set-cookie'].split(';').first, response.body]
    end

    def create_user(url, params, cookie, http)
      request = Net::HTTP::Post.new(URI(url))
      request.body = URI.encode_www_form(params)
      request['Cookie'] = cookie

      http.request(request)
    end

    def get_csrf_token(body)
      html = Nokogiri::HTML(body)
      html.at('input[@name=authenticity_token]')['value']
    end
  end
end
