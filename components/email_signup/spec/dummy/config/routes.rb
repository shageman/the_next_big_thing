Rails.application.routes.draw do

  mount EmailSignup::Engine => "/email_signup"
end
