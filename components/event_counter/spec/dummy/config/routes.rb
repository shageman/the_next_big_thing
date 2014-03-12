Rails.application.routes.draw do

  mount EventCounter::Engine => "/event_counter"
end
