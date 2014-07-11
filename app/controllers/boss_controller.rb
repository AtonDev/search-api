class BossController < ApplicationController

  def get_boss_results
    query = params["search"]

    #BOSS stuff----
    urls = []
    res = YBoss.web('q' => 'tuscany')
    res.items.each do |i|
      urls << i.url
    end
    #--------------
    render :json => {urls: urls}
  end

end
