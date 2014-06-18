require 'spec_helper'

describe Spree::StylesheetsController do
  describe '#show' do
    context 'with a bad format' do
      it 'still responds with blank sheet' do
        spree_get :show, format: :xml
        expect(response.header['Content-Type']).to include 'text/css'
      end

      it 'still responds with found sheet' do
        create(:stylesheet).style_compressed
        spree_get :show, format: :atom
        expect(response.header['Content-Type']).to include 'text/css'
      end
    end

    context 'when there is no stylesheet' do
      it 'displays a blank stylesheet' do
        spree_get :show, format: :css
        expect(assigns[:style]).to be_a Spree::BlankStylesheet
      end
    end

    context 'when there is a stylesheet' do
      it 'assigns the stored sheet' do
        create :stylesheet
        spree_get :show, format: :css
        expect(assigns[:style]).to be_a Spree::Stylesheet
      end
    end
  end
end
