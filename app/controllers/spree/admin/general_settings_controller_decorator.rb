Spree::Admin::GeneralSettingsController.class_eval do
  def update
    params.each do |name, value|
      next unless Spree::Config.has_preference? name

      Spree::Config[name] = value
    end

    if current_store.update_attributes(store_params)
      flash[:success] = Spree.t(:successfully_updated,
                                resource: Spree.t(:general_settings))
    else
      flash[:error] = current_store.errors.full_messages.join(". ")
    end

    redirect_to edit_admin_general_settings_path
  end
end
