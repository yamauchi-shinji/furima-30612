class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day 
  with_options presence: true do
    validates :images, :product, :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[\d]+\z/i }
    validates :category_id, :status_id, :shipping_charge_id, :prefecture_id, :day_id, numericality: { other_than: 0 }
  end
  has_many_attached :images
  belongs_to :user
  has_one :purchase
  has_many :messages
  def self.search(search)
    if search != ""
      Item.where('product LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
