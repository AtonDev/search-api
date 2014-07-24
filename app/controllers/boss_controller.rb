class BossController < ApplicationController

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


end
