class AnilistApiService
  class << self
    require 'uri'
    require 'net/http'
    require 'openssl'
    @@url = URI('https://anilist-graphql.p.rapidapi.com/')


    def anime(search)
      http = Net::HTTP.new(@@url.host, @@url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(@@url)
      request['content-type'] = 'application/json'
      request['x-rapidapi-host'] = Rails.application.credentials.AniList_host
      request['x-rapidapi-key'] = Rails.application.credentials.AniList_key
      request.body = "{\"query\":\"query {\
        Page (page: 1, perPage: 150) {\
          media (search: \\\"#{search}\\\", isAdult: false, sort: POPULARITY_DESC) {\
          id\
          title {\
            english\
            native\
          }\
          status\
          seasonYear\
          season\
          genres\
          recommendations {\
            edges {\
              node {\
                id\
              }\
            }\
          }\
          type\
          description\
          bannerImage\
          coverImage {\
            extraLarge\
          }\
          }\
          }\
        }\
      \"}"

      response = ActiveSupport::JSON.decode(http.request(request).body)['data']['Page']['media']
    end

    def show(id)
      http = Net::HTTP.new(@@url.host, @@url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(@@url)
      request = Net::HTTP::Post.new(@@url)
      request['content-type'] = 'application/json'
      request['x-rapidapi-host'] = Rails.application.credentials.AniList_host
      request['x-rapidapi-key'] = Rails.application.credentials.AniList_key
      request.body = "{\"query\":\"query {\
        Media (id: #{id}, isAdult: false) {\
          id\
          title {\
            english\
            native\
          }\
          description\
          genres\
          seasonYear\
          status\
          type\
          episodes\
          averageScore\
          recommendations {\
            edges {\
              node {\
                 mediaRecommendation {\
                  id\
                  title {\
                    english\
                    native\
                  }\
                  genres\
                  description\
                  type\
                   coverImage {\
                     extraLarge\
                     large\
                     medium\
                     color\
                   }\
                 }\
              }\
            }\
          }\
          coverImage {\
            extraLarge\
            large\
            medium\
            color\
          }\
          bannerImage\
        }\
    }\"}"

      response = ActiveSupport::JSON.decode(http.request(request).body)['data']['Media']
    end
  end
end
# 20665
