require 'rubygems'
require 'httparty'
require 'json'
module Songkick
  class Event
    attr_accessor :title, :lineup, :location
    def initialize(event_hash)
      @title = event_hash['displayName']
      @lineup = event_hash['performance'].map{|p| p['artist']}.map{|a| a['displayName']}
      @venue = Venue.new(event_hash['venue'])
    end
  end

  class Venue
    attr_accessor :name, :city, :latitude, :longitude
    def initialize(venue_hash)
      @name = venue_hash['displayName']
      @city = venue_hash['metroArea']['displayName']
      @latitude = venue_hash['lat']
      @longitude = venue_hash['lng']
    end
  end

  include HTTParty
  base_uri 'http://api.songkick.com/api/3.0/'
  default_params :apikey => YAML.load_file('./config/songkick.yml')['apikey']

  def self.search_events(options)
    response = get '/events.json', :query => options
    events_hash = response['resultsPage']['results']['event']
    events = events_hash.map{|event| Event.new(event)}
  end
end