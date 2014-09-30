Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :stylesheets do
      collection do
        post :restore
      end
    end
  end

  match 'dandystyles', to: 'stylesheets#show', via: :all
end
