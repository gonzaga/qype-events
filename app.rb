require 'sinatra'

set :haml, :format => :html5

get '/' do
  haml 'Hello schmorld!'
end