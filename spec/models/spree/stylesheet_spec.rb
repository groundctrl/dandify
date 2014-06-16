require 'spec_helper'

describe Spree::Stylesheet do
  context 'validations' do
    it { should validate_presence_of(:style_raw) }
  end
end
