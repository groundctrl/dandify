require 'spec_helper'

module Spree
  describe Stylesheet do
    context 'versions', versioning: true do
      it { should be_versioned }

      it 'restores previous versions' do
        style = create :stylesheet
        style.update style_raw: 'h1{display:none; color: blue;}'

        expect(style.versions.size).to eq(2)
      end
    end

    context 'validations' do
      let(:valid_css)   { '#main {background-color: #0000ff}' }
      let(:invalid_css) { 'main {background-color #0000ff}' }

      it { should validate_presence_of(:style_raw) }

      it 'pass with proper vanilla syntax' do
        expect(style_with valid_css).to be_valid
      end

      it 'fail with bad vanilla syntax' do
        expect(style_with invalid_css).to_not be_valid
      end
    end

    context 'processing raw' do
      it 'allows both css and scss' do
        expect(style_with(<<-CSS)).to be_valid

  $font-stack: Helvetica, sans-serif;

  body {
    font: 100% $font-stack
  }

  h1 { display: inline ;}

        CSS
      end

      context 'compresses' do
        it 'vanilla css' do
          compressed = "#main{display:block}.foo{width:300px;height:200px}\n"
          expect(create_style_with(<<-CSS).style_compressed).to eq compressed

  #main {
     display: block;
  }

  .foo {
    width: 300px;
    height: 200px;
  }

          CSS
        end

        it 'compresses scss' do
          compressed = "nav ul{margin:0;padding:0}a{display:block}\n"
          expect(create_style_with(<<-CSS).style_compressed).to eq compressed

  nav {
    ul {
      margin: 0;
      padding: 0;
    }
  }

  a {
    display: block;
  }

          CSS
        end
      end
    end

    def create_style_with(css)
      style = style_with(css)
      style.save
      style
    end

    def style_with(css)
      Spree::Stylesheet.new(style_raw: css)
    end
  end

  describe Stylesheet, '#load_style' do
    it 'returns Blanksheet when no sheet is found' do
      expect(described_class.load_style).to be_a Spree::BlankStylesheet
    end

    it 'returns a found instance of itself' do
      styles = create :stylesheet
      expect(described_class.load_style).to eq styles
    end
  end
end


