SearchApi::Application.routes.draw do

  get "s" => "boss#get_boss_results"
  get "scomp" => "boss#get_boss_full_results"
  root "boss#ping"

end
