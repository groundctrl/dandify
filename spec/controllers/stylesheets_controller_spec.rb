require 'spec_helper'

describe Spree::Admin::StylesheetsController do
  stub_authorization!

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
end
