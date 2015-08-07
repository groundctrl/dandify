require 'spec_helper'

module Spree
  module Admin
    describe NavigationHelper do
      describe '#link_to_restore_url' do
        let(:restore_path) { spree.edit_admin_stylesheets_path }

        context 'link to restore URL' do
          it 'should build circular restore button' do
            restore_button = helper.link_to_restore_url(restore_path)

            expect(restore_button).
              to include(Spree.t('dandify.admin.confirm.restore'))
          end
        end
      end
    end
  end
end
