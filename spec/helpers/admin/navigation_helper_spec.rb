require 'spec_helper'

describe Spree::Admin::NavigationHelper do
  describe '#link_to_restore_url' do
    let(:restore_path) { spree.edit_admin_stylesheets_path }

    context 'link to restore URL' do
      it 'should build circular restore button' do
        restore_button = helper.link_to_restore_url(restore_path)
        restore_button.should include(Spree.t('dandify.confirm.restore'))
      end
    end
  end
end
