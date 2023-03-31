require 'sinatra'
require 'json'

set :port, 4567

post '/v2/api' do
  content_type :json

  request.body.rewind
  payload = JSON.parse(request.body.read)

  if payload['user']
    { message: 'Payload received and validated successfully' }.to_json
  else
    status 400
    { error: 'Invalid payload. "user" token not found.' }.to_json
  end
end
