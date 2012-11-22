require 'sinatra'
require 'json'
require_relative '../math/math'

module Home
  
  get '/' do
    erb :home
  end
  
  get '/data' do
    status 200
    content_type 'application/json'

    response = JiraMath.return_graph_total_time
    response.to_json
  end

end