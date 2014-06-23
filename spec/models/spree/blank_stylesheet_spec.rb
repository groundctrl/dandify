require 'spec_helper'

describe Spree::BlankStylesheet, '#style_compressed' do
  it 'returns a blank string' do
    expect(Spree::BlankStylesheet.new.style_compressed).to eq ''
  end
end
