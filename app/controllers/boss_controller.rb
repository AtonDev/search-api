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

  def ping
    render :json => {status: 'ok'}
  end

  def get_boss_full_results
    query = params["search"]

    unless query == ""
      urls = []
      dispurls = []
      titles = []
      abstracts = []
      res = YBoss.web('q' => query)
      res.items.each do |i|
        urls << i.url
        dispurls << i.dispurl
        titles << i.title
        abstracts << i.abstract 
      end
    end
    #--------------
    render :json => {urls: urls}
  end

end
