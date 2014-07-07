Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :stylesheets
  end

  match 'dandystyles', to: 'stylesheets#show', via: :all
end
