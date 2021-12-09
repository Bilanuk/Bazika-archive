class AnilistApi
  class << self
    require 'uri'
    require 'net/http'
    require 'openssl'

    def anime(search)
      url = URI('https://anilist-graphql.p.rapidapi.com/')
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(url)
      request['content-type'] = 'application/json'
      request['x-rapidapi-host'] = 'anilist-graphql.p.rapidapi.com'
      request['x-rapidapi-key'] = '095e732524mshd74be2bf3d5f145p1501cfjsn7477df35af0a'
      request.body = "{\"query\":\"query {\
        Media (search: \\\"#{search}\\\", type: ANIME) {\
              title {\
                english\
              }\
            }\
          }\"}"

      response = ActiveSupport::JSON.decode(http.request(request).body)
    end
  end
end
