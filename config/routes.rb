BucketerWebapp::Application.routes.draw do
  match 'buckets/steps', to: 'buckets#steps', via: :post
  match 'share', to: 'buckets#share', via: :post
  root to: "buckets#index"
end
