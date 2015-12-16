Spree::BaseHelper.class_eval do
  def logo(image_path = Spree::Config.logo)
    image_path = current_store.logo.url if current_store.logo.exists?

    link_to image_tag(image_path, alt: current_store.name), spree.root_path
  end
end
