module Spree
  class Stylesheet < ActiveRecord::Base
    validates :style_raw, presence: true
    validate :compilation

    has_paper_trail :only => [:style_raw]

    private

    def compilation
      self.style_compressed = render_sass
    end

    def sass_engine
      Sass::Engine.new style_raw, syntax: :scss, style: :compressed
    end

    def render_sass
      sass_engine.render
    rescue => err
      errors.add :style_raw, err.message
      nil
    end
  end
end
