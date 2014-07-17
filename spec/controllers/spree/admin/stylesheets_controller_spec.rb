require 'spec_helper'

describe Spree::Admin::StylesheetsController, versioning: true do
  stub_authorization!

  let(:show_path) { spree.admin_stylesheets_path }
  let(:bad_style) { 'body {color:#ffff00;' }

  before do
    user = create :admin_user
    controller.stub(try_spree_current_user: user)
  end

  context '#new' do
    it 'can create first a revision' do
      style = create :stylesheet
      spree_get :show
      expect(assigns[:style]).to eq style
      expect(assigns[:style].versions.size).to eq 1
    end

    it 'can not create first revision with error' do
      spree_post :new, stylesheet: { style_raw: bad_style }
      response.should render_template(:new)
      expect(assigns[:style].versions.size).to eq 0
    end
  end

  context '#edit' do
    it 'can create a revision' do
      create :stylesheet
      spree_get :show
      expect(assigns[:style].versions.size).to eq 1
    end

    it 'can not create a revision with error' do
      spree_post :edit, stylesheet: { style_raw: bad_style }
      response.should render_template(:edit)
    end
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

  context '#restore' do
    before { create :stylesheet }

    it 'fails to reify when there is only one revision' do
      spree_post :restore
      flash[:error].should eq Spree.t('dandify.restore.error')
      response.should redirect_to show_path
    end

    it 'able to reify when there is more than one revision' do
      create :another_stylesheet
      spree_post :restore
      response.should redirect_to show_path
    end
  end
end
