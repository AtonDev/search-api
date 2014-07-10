class BossController < ApplicationController

  def get_boss_results
    query = params["search"]

    #BOSS stuff----
    boss = BOSSMan::Search.web("prospect park", :count => 10, :filter => "-hate")

    boss.results.each do |result|
      urls << result.url
    end
    #--------------

    urls = ["http://en.wikipedia.org/wiki/Arturo"]
    render :json => {urls: urls}
  end


end
