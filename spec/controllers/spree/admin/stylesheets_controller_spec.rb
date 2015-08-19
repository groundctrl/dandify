require 'spec_helper'

module Spree
  module Admin
    describe StylesheetsController, type: :controller do
      stub_authorization!

      let(:show_path) { spree.admin_stylesheets_path }
      let(:good_style) { 'body {color:#ffff00;}' }
      let(:bad_style) { 'body {color:#ffff00;' }

      before do
        user = create :admin_user
        controller.stub(try_spree_current_user: user)
      end

      describe 'GET #show' do
        it 'assigns new instance when none is found' do
          spree_get :show

          expect(assigns[:style]).to be_new_record
        end

        it 'assigns existing' do
          style = create :stylesheet

          spree_get :show

          expect(assigns[:style]).to eq style
        end
      end

      describe 'GET #new' do
        it 'renders template' do
          spree_get :new

          expect(response).to render_template(:new)
        end
      end

      describe 'POST #create' do
        it 'redirects to show with good data' do
          spree_post :create,
                     stylesheet: { style_raw: '#main { display: inline; }' }

          expect(response).to redirect_to(admin_stylesheets_path)
        end

        it 'renders new with bad data' do
          spree_post :create, stylesheet: { style_raw: bad_style }

          expect(response).to render_template(:new)
        end
      end

      describe 'GET #edit' do
        it 'can create a revision' do
          stylesheet = create :stylesheet

          spree_get :edit

          expect(assigns[:style]).to eq stylesheet
        end
      end

      describe 'PUT #update' do
        before { create :stylesheet }

        it 'redirects to show with good data' do
          spree_post :update,
                     stylesheet: { style_raw: '#main { display: inline; }' }

          expect(response).to redirect_to(admin_stylesheets_path)
        end

        it 'renders edit with bad data' do
          spree_post :update, stylesheet: { style_raw: bad_style }

          expect(response).to render_template(:edit)
        end
      end

      describe 'POST #restore', versioning: true do
        before { create :stylesheet }

        it 'fails to reify when there is only one revision' do
          spree_post :restore

          expect(flash[:error]).to eq(
            Spree.t('dandify.admin.flash.error.restore')
          )

          expect(response).to redirect_to show_path
        end

        it 'able to reify when there is more than one revision' do
          style = Spree::Stylesheet.first

          style.update_attributes style_raw: '#main { display: block; }'
          style.update_attributes style_raw: '#main { display: none; }'

          spree_post :restore, id: PaperTrail::Version.second.id

          expect(flash[:success]).to eq(
            Spree.t('dandify.admin.flash.success.restore')
          )
          expect(response).to redirect_to show_path
        end
      end

      describe 'DELETE #destroy' do
        it 'sends #destroy to returned model from #first_or_initialize' do
          fake_stylesheet = instance_double(Spree::Stylesheet, destroy: true)
          allow(Spree::Stylesheet).to receive(:first_or_initialize).
            and_return fake_stylesheet

          spree_delete :destroy

          expect(fake_stylesheet).to have_received(:destroy)
          expect(response).to redirect_to admin_stylesheets_path
        end
      end
    end
  end
end
