class AnilistApiService
  class << self
    require 'uri'
    require 'net/http'
    require 'openssl'
    @@url = URI('https://anilist-graphql.p.rapidapi.com/')
    @@api_host = ENV['ANILIST_HOST'].gsub("\n", "")
    @@api_key = ENV['ANILIST_KEY'].gsub("\n", "")


    def anime(search)
      http = Net::HTTP.new(@@url.host, @@url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(@@url)
      request['content-type'] = 'application/json'
      request['x-rapidapi-host'] = @@api_host
      request['x-rapidapi-key'] = @@api_key
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
      request['x-rapidapi-host'] = @@api_host
      request['x-rapidapi-key'] = @@api_key
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

    def most_popular
      http = Net::HTTP.new(@@url.host, @@url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(@@url)
      request['content-type'] = 'application/json'
      request['x-rapidapi-host'] = @@api_host
      request['x-rapidapi-key'] = @@api_key
      request.body = "{\"query\":\"query {\
        Page (page: 1, perPage: 100) {\
          media (sort: POPULARITY_DESC, isAdult: false) {\
            id\
            title {\
              english\
              native\
            }\
            description\
            type\
            genres\
            coverImage {\
              extraLarge\
              large\
              medium\
            }\
          }\
        }\
      }\"}"

      response = ActiveSupport::JSON.decode(http.request(request).body)['data']['Page']['media']
    end
  end
end
