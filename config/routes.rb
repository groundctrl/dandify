Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :stylesheets do
      post 'restore', to: 'stylesheets#restore'
    end
  end

  match 'dandystyles', to: 'stylesheets#show', via: :all
end
