SearchApi::Application.routes.draw do

  get "s" => "boss#get_boss_results"
  get "new_token" => "boss#get_new_token"
  root "boss#ping"

end
