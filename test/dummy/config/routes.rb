Rails.application.routes.draw do
  mount EventLogger::Engine => "/event_logger"
  root to: "pages#index"
end
