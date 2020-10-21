class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :user_id, :item_id, :token, :price
  with_options presence: true do
    validates :postal_code, format: { with:/\A\d{3}[-]\d{4}\z/i}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city, :house_number, :token, :price
    validates :phone, format: { with:/\A[\d]+\z/i }, length: { maximum: 11 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone: phone, purchase_id: purchase.id)
  end
end