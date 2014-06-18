module Spree
  class Stylesheet < ActiveRecord::Base
    validates :style_raw, presence: true
    validate :compilation

    has_paper_trail only: [:style_raw]

    def self.load_style
      first || BlankStylesheet.new
    end

    private

    def compilation
      self.style_compressed = rendered_sass
    end

    def sass_engine
      Sass::Engine.new style_raw, syntax: :scss, style: :compressed
    end

    def rendered_sass
      sass_engine.render
    rescue => err
      errors.add :style_raw, err.message
      nil
    end
  end
end
