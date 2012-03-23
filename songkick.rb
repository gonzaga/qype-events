require 'httparty'
module Songkick
  include HTTParty
  base_uri 'http://api.songkick.com/api/3.0/'

  def search_events(options)
    response = get 'events.json', :query => options
  end

  def handle_response(response)
    
  end
end