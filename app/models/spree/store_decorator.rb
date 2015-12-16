Spree::Store.class_eval do
  has_attached_file :logo,
                    url: "/spree/stores/:id/:style/:basename.:extension",
                    styles: { original: "250x250>" },
                    path: ":rails_root/public/spree/stores/logo/:basename.:extension"

  validates_attachment :logo,
                       content_type: { content_type: %r(image/.*) },
                       size: { in: 0..2.megabytes }

  attr_accessor :logo_content_type, :logo_file_size
end
