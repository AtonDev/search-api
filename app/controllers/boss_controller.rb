class BossController < ApplicationController

  def get_boss_results
    query = params["search"]

    #BOSS stuff----
    unless query == ""
      urls = []
      res = YBoss.web('q' => query)
      res.items.each do |i|
        urls << i.url
      end
    end
    #--------------
    render :json => {urls: urls}
  end


end
