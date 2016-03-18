class Classified < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_attached_file :image, styles: {
    medium: '300x300',
    square: '200x200',
    thumb: '100x100',
  }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
