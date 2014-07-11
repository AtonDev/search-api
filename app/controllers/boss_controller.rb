class BossController < ApplicationController

  def get_boss_results
    query = params["search"]

    #BOSS stuff----
    urls = ['www.google.com']
   
    #--------------
    render :json => {urls: urls}
  end


end
