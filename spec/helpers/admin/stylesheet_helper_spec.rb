require 'spec_helper'

module Spree
  module Admin
    describe StylesheetHelper do
      describe '#dandify_version_email' do
        context 'with nil or unknown values' do
          let(:fake_unknown_user) { instance_double(UnknownUser, email: 'foo') }

          before do
            allow(UnknownUser).to receive(:new) { fake_unknown_user }
          end

          context 'when user_id is nil' do
            it 'instantiates a new UknownUser and calls #email' do
              helper.dandify_version_email(nil)

              expect(UnknownUser).to have_received(:new)
              expect(fake_unknown_user).to have_received(:email)
            end
          end

          context 'when user_id equals Spree.t("dandify.admin.unknown")' do
            it 'instantiates a new UknownUser and calls #email' do
              helper.dandify_version_email(Spree.t('dandify.admin.unknown'))

              expect(UnknownUser).to have_received(:new)
              expect(fake_unknown_user).to have_received(:email)
            end
          end
        end

        context 'with everything else' do
          it 'sends user_id to User#find and calls email' do
            fake_user = instance_double(User, email: 'foo')
            allow(User).to receive(:find) { fake_user }

            helper.dandify_version_email('1')

            expect(User).to have_received(:find).with '1'
            expect(fake_user).to have_received(:email)
          end
        end
      end
    end
  end
end
