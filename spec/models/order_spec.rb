require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @purchase_order = FactoryBot.build(:purchase_order)
  end

  context '登録がうまくいくとき' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@purchase_order).to be_valid
    end
    it "building_nameが空でも登録できること" do
      @purchase_order.building_name = nil
      expect(@purchase_order).to be_valid
    end
  end
  context '登録ができないとき' do
    it "priceが空では登録できないこと" do
      @purchase_order.price = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Price can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @purchase_order.token = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空では保存できないこと' do
      @purchase_order.postal_code = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_order.postal_code = "12345678"
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Postal code is invalid")
    end
    it 'postal_codeが全角のハイフンを含んだものは保存できないこと' do
      @purchase_order.postal_code = "123ー4567"
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Postal code is invalid")
    end
    it "prefecture_idが空では登録できないこと" do
      @purchase_order.prefecture_id = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "prefecture_idが0(--)では登録できないこと" do
      @purchase_order.prefecture_id = 0
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it "cityが空では登録できないこと" do
      @purchase_order.city = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("City can't be blank")
    end
    it "house_numberが空では登録できないこと" do
      @purchase_order.house_number = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("House number can't be blank")
    end
    it "phoneが空では登録できないこと" do
      @purchase_order.phone = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが全角数字では登録できないこと' do
      @purchase_order.phone = "１２３４５６７８９"
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone is invalid")
    end
    it 'phoneが半角(-)が含まれると登録できないこと' do
      @purchase_order.phone = "123-456789"
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone is invalid")
    end
    it 'phoneが12文字では登録できないこと' do
      @purchase_order.phone = "123456789012"
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
    end
  end
end
