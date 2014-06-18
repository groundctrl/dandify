Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :stylesheet
  end

  match 'dandystyles', to: 'spree/stylesheets#show', via: :all
end
