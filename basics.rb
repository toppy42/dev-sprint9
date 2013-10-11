require 'rubygems'
require 'sinatra'

get '/' do 
	"Tsup bitch"
end

get '/hello/:name' do
	"Hey #{params[:name]}, get out of my house"
end

get '/hello/:name/:city' do
	"Hey #{params[:name]}, you should really checkout #{params[:city]}"
end

get '/all/*' do
	"Yes.... all the #{params[:splat][0]}"
end

get '/form' do
	erb :form
end

post '/form' do
	"<p>Why would you say that!?
	How dare you say '#{params[:message]}'</p>"
end

get '/secret' do
	erb :secret
end

post '/secret' do
	params[:secret].reverse
end

get '/decrypt/:secret' do
	params[:secret].reverse
end

not_found do
	status 404
	'Well shit, looks like your lost'
end
