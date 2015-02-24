class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    url = 'https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/BullSchlitz79?api_key=b75dd34f-46a6-44b8-9633-35a95fc51fec'
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts 'dddddddd'
    puts res.body
    @data = res.body
  end
end
