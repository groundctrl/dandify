Spree::Admin::NavigationHelper.class_eval do
  def link_to_restore_url(url, options = {})
    name = options[:name] || Spree.t('dandify.admin.icons.restore')
    options[:class] = 'restore-resource btn btn-sm btn-primary icon icon-clone'
    options[:data] = { confirm: Spree.t('dandify.admin.confirm.restore'),
                        action: 'restore' }
    link_to_with_icon('history', name, url, options)
  end

  def link_to_destroy_url
    options = {
      class: 'btn btn-danger',
      data: {
        confirm: Spree.t('dandify.admin.confirm.destroy'),
        action: 'delete'
      },
      method: :delete
    }

    link_to_with_icon 'delete',
                      Spree.t('dandify.admin.icons.destroy'),
                      admin_stylesheets_path,
                      options
  end
end
