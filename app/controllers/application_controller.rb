class ApplicationController < ActionController::Base

  require 'net/http'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    summoner_name = 'BullSchlitz79'
    url = URI.parse("https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/#{summoner_name}?api_key=b75dd34f-46a6-44b8-9633-35a95fc51fec")
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    response = http.request(req)
    summoner_base = JSON.parse(response.body)
   
    summoner_id = summoner_base[summoner_name.downcase]['id']

    url = URI.parse("https://na.api.pvp.net/api/lol/na/v1.3/game/by-summoner/#{summoner_id}/recent?api_key=b75dd34f-46a6-44b8-9633-35a95fc51fec")
    req = Net::HTTP::Get.new(url.to_s)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    response = http.request(req)

    @data =  response.body
  end
end
