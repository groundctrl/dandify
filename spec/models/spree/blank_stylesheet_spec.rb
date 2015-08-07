require 'spec_helper'

module Spree
  describe BlankStylesheet, '#style_compressed' do
    it 'returns a blank string' do
      expect(subject.style_compressed).to eq ''
    end
  end
end
