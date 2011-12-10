BucketerWebapp::Application.routes.draw do
  match 'buckets/steps', to: 'buckets#steps', via: :post
  root to: "buckets#index"
end
