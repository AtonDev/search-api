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

    render :json => {urls: urls, dispurls: dispurls, titles: titles, abstracts: abstracts}
    
  end

  def get_boss_hidden_full_results
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
    results = {urls: urls, dispurls: dispurls, titles: titles, abstracts: abstracts}.to_json
    render inline: "<div id='data' style='display:none;'>#{results}</div>".html_safe
    
  end

  private

  def new_token
    token = loop do 
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless UserToken.exists?(token: random_token)
    end
  end
end
