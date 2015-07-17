require 'bundler'
require 'twilio-ruby'
Bundler.require

require './models/model.rb'

class MyApp < Sinatra::Base
  
account_sid = 'AC6c675eef9261893d0bf17b9a58b80cb4' 
auth_token = 'f679c4bb69afd0b58969ff634718970d' 
  
  get '/' do
    erb :index
  end
  
  
  post '/results' do
    @number = params[:number]
    @message = params[:message]
    @client = Twilio::REST::Client.new account_sid, auth_token 
 
  @client.account.messages.create({
  :body => @message,
  :to => @number,
	:from => "+18622518406", 
})
    
    erb :results
  end
  

  
end