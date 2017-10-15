class Listing < ApplicationRecord
  has_attached_file :image, styles: { medium: "200x", thumb: "100x100" }, default_url: "thumb.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates :name, :description, :price, :category, :country, presence: true
    validates :price, numericality: { greater_than: 0 }

    validates_attachment_presence :image

    belongs_to :user


  #   scope :most_recent, -> {
  #   order("created_at DESC").limit(1)
  # }

end
