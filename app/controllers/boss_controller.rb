class BossController < ApplicationController

  def get_boss_results
    query = params["search"]

    #BOSS stuff----
    urls = []
    boss = BOSSMan::Search.web("prospect park", :count => 10, :filter => "-hate")

    boss.results.each do |result|
      urls << result.url
    end
    #--------------
    render :json => {urls: urls}
  end


end
