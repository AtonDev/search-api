SearchApi::Application.routes.draw do

  get "s" => "boss#get_boss_results"
  root "boss#ping"

end
