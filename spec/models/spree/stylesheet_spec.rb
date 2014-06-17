require 'spec_helper'

describe Spree::Stylesheet do
  context 'versions', versioning: true do
    it { should be_versioned }

    it 'restores previous versions' do
      style = create :stylesheet
      style.update style_raw: 'h1{display:none; color: blue;}'

      expect(style.versions.size).to eq(2)
    end
  end

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

  context 'processing raw' do
    it 'allows both css and scss' do
      mixed =<<-STR

        $font-stack: Helvetica, sans-serif;

        body {
          font: 100% $font-stack
        }

        h1 { display: inline ;}

      STR
      expect(style_with mixed).to be_valid
    end

    context 'compresses' do
      it 'vanilla css' do
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
        style = create_style_with(uncompressed)
        expect(style.style_compressed).to eq compressed
      end

      it 'compresses scss' do
        uncompressed = <<-STR

        nav {
          ul {
            margin: 0;
            padding: 0;
          }
        }

        a {
          display: block;
        }

        STR

        style = create_style_with(uncompressed)
        compressed = "nav ul{margin:0;padding:0}a{display:block}\n"
        expect(style.style_compressed).to eq compressed
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
