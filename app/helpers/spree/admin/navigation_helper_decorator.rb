Spree::Admin::NavigationHelper.class_eval do
  def link_to_restore_url(url, options = {})
    name = options[:name] || Spree.t('dandify.admin.icons.restore')
    options[:class] = 'restore-resource'
    options[:data] = { confirm: Spree.t('dandify.admin.confirm.restore'),
                        action:  'restore' }
    link_to_with_icon('history', name, url, options)
  end
end
