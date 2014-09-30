require 'spec_helper'

describe Spree::Admin::StylesheetsController do
  stub_authorization!

  let(:show_path) { spree.admin_stylesheets_path }
  let(:good_style) { 'body {color:#ffff00;}' }
  let(:bad_style) { 'body {color:#ffff00;' }

  before do
    user = create :admin_user
    controller.stub(try_spree_current_user: user)
  end

  context '#show' do
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

  context '#new' do
    it 'can create first a revision' do
      style = create :stylesheet
      spree_get :show
      expect(assigns[:style]).to eq style
      expect(response).to render_template(:show)
    end

    it 'can not create first revision because error' do
      spree_post :create, stylesheet: { style_raw: bad_style }
      expect(response).to render_template(:new)
    end
  end

  context '#edit' do
    it 'can create a revision' do
      create :stylesheet
      spree_get :show
      expect(response).to render_template(:show)
    end

    it 'can not create a revision because error' do
      spree_post :update, stylesheet: { style_raw: bad_style }
      expect(response).to render_template(:edit)
    end
  end

  context '#restore', versioning: true do
    before { create :stylesheet }

    it 'fails to reify when there is only one revision' do
      spree_post :restore
      expect(flash[:error]).to eq(
        Spree.t('dandify.admin.flash.error.restore')
      )
      expect(response).to redirect_to show_path
    end

    it 'able to reify when there is more than one revision' do
      spree_post :update, stylesheet: { style_raw: good_style }
      spree_post :restore
      expect(flash[:success]).to eq(
        Spree.t('dandify.admin.flash.success.restore')
      )
      expect(response).to redirect_to show_path
    end
  end
end
