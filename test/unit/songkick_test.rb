require 'test/unit'
require File.dirname(__FILE__) + "/../../songkick.rb"

class SongkickTest < Test::Unit::TestCase
  def test_should_find_events
    options = {}
    options[:location] = 'geo:53.551731,9.989319'
    options[:min_date] = '2012-05-04'
    options[:max_date] = '2012-05-04'
    events = Songkick.search_events(options)
    assert events.any?
  end
end