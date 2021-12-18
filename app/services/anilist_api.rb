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
      request['x-rapidapi-host'] = Rails.application.credentials.AniList_host
      request['x-rapidapi-key'] = Rails.application.credentials.AniList_key
      request.body = "{\"query\":\"query {\
      Page (page: 1, perPage: 10) {\
        media (search: \\\"Attack on titan\\\") {\
        title {\
          english\
          native\
        }\
        description\
        bannerImage\
        coverImage {\
          extraLarge\
          large\
          medium\
          color\
        }\
        }\
        }\
      }\
    \"}"

      response = ActiveSupport::JSON.decode(http.request(request).body)
    end
  end
end
