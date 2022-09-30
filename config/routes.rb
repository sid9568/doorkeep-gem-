Rails.application.routes.draw do
  get 'admin/login'
  use_doorkeeper
 namespace :api do
    namespace :v1 do
      post "signup"=>"users#signup"
      post "login"=>"sessions#login"
      post"update/password" => "users#update_password"

     

end
end
end
