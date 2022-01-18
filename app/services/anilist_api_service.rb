class AnilistApiService
  class << self
    require 'uri'
    require 'net/http'
    require 'openssl'
    URL = URI('https://anilist-graphql.p.rapidapi.com/')
    API_HOST = ENV['ANILIST_HOST'].gsub("\n", "")
    API_KEY = ENV['ANILIST_KEY'].gsub("\n", "")


    def anime(search, page)
      http = Net::HTTP.new(URL.host, URL.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(URL)
      request['content-type'] = 'application/json'
      request['x-rapidapi-host'] = API_HOST
      request['x-rapidapi-key'] = API_KEY
      request.body = "{\"query\":\"query {\
        Page (page: #{page}, perPage: 10) {\
          pageInfo {\
            total\
            perPage\
            currentPage\
            lastPage\
            hasNextPage\
        }\
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

      response = ActiveSupport::JSON.decode(http.request(request).body)['data']['Page']
    end

    def show(id)
      http = Net::HTTP.new(URL.host, URL.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(URL)
      request = Net::HTTP::Post.new(URL)
      request['content-type'] = 'application/json'
      request['x-rapidapi-host'] = API_HOST
      request['x-rapidapi-key'] = API_KEY
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

    def most_popular(page)
      http = Net::HTTP.new(URL.host, URL.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(URL)
      request['content-type'] = 'application/json'
      request['x-rapidapi-host'] = API_HOST
      request['x-rapidapi-key'] = API_KEY
      request.body = "{\"query\":\"query {\
        Page (page: #{page}, perPage: 10) {\
          pageInfo {\
            total\
            perPage\
            currentPage\
            lastPage\
            hasNextPage\
        }\
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

      response = ActiveSupport::JSON.decode(http.request(request).body)['data']['Page']
    end

    def save(id, title_params)
      http = Net::HTTP.new(URL.host, URL.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(URL)
      request['content-type'] = 'application/json'
      request['x-rapidapi-host'] = API_HOST
      request['x-rapidapi-key'] = API_KEY
      request.body = "{\"query\":\"query {\
        Media (id: #{id}, isAdult: false) {\
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
      }\"}"

      response = ActiveSupport::JSON.decode(http.request(request).body)['data']['Media']
      response[:api_id] = response.delete('id')
      response[:title_type] = response.delete('type')
      response[:name] = response.delete('title').values[0]
      response[:coverImage] = response.delete('coverImage').values[0]
      response[:favourite] = title_params[:favourite] if title_params[:favourite].present?
      response[:status] = title_params[:status] if title_params[:status].present?
      response
    end
  end
end
# document.getElementsByClassName('alert-body')[0].innerHTML = "<%= j render 'shared/alert' %>";
# document.querySelector('#recommendations').innerHTML = "<%= j render('search/recommendations', recommendations: @recommendations)%>"
