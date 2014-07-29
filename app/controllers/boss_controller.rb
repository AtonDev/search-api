class BossController < ApplicationController

  def get_new_token
    render :json => {token: new_token}
  end

  def get_boss_results
    query = params["search"]
    urls = []
    
    for i in 0..5
      begin
        #BOSS stuff----
        unless query == ""
          res = YBoss.web('q' => query)
          res.items.each do |i|
            urls << i.url
          end
        end
        #--------------
        break
      rescue Exception => e
      end
    end
    render :json => {urls: urls}
  end

  def ping
    render :json => {status: 'ok'}
  end


  private

  def new_token
    token = loop do 
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless UserToken.exists?(token: random_token)
    end
  end
end
