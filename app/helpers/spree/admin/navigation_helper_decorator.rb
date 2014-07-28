Spree::Admin::NavigationHelper.class_eval do
  def link_to_restore_url(url, options = {})
    name = options[:name] || Spree.t('dandify.restore.name')
    options[:class] = 'restore-resource'
    options[:data] = { confirm: Spree.t('dandify.confirm.restore'),
                       action:  'restore' }
    link_to_with_icon('history', name, url, options)
  end
end
