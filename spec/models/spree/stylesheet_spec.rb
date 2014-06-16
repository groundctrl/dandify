require 'spec_helper'

describe Spree::Stylesheet do
  context 'validations' do
    let(:valid_css) { '#main {background-color: #0000ff}' }
    let(:invalid_css) { 'main {background-color #0000ff}' }

    it { should validate_presence_of(:style_raw) }

    it 'pass with proper vanilla syntax' do
      expect(style_with valid_css).to be_valid
    end

    it 'fail with bad vanilla syntax' do
      expect(style_with invalid_css).to_not be_valid
    end
  end

  context 'post processing' do
    it 'compresses vanilla css' do
      uncompressed = <<-STR

      #main {
         display: block;
      }

      .foo {
        width: 300px;
        height: 200px;
      }

      STR
      compressed = "#main{display:block}.foo{width:300px;height:200px}\n"
      style = style_with(uncompressed)
      style.save

      expect(style.style_compressed).to eq compressed
    end
  end

  def style_with(css)
    Spree::Stylesheet.new(style_raw: css)
  end
end
