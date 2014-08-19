SearchApi::Application.routes.draw do

  get "s" => "boss#get_boss_results"
  get "new_token" => "boss#get_new_token"
  get "scomp" => "boss#get_boss_full_results"
  get "shcomp" => "boss#get_boss_hidden_full_results"
  root "boss#ping"

end
