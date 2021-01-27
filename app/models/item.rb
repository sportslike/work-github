class Item < ApplicationRecord

  belongs_to :genre, optional: true
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  attachment :image

  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end
