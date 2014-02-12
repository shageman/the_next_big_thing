Teaser::Engine.routes.draw do
  resources "tease", only: [:new, :create]
  root :to => 'tease#new'
end
