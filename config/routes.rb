Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :stylesheets do
      get 'restore/:id', to: 'stylesheets#restore', as: 'restore'
    end
  end

  match 'dandystyles', to: 'stylesheets#show', via: :all
end
