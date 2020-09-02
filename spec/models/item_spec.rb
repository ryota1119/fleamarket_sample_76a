require 'rails_helper'
describe Item do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "descriptionがない場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "conditonがない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "statusがない場合は登録できないこと" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "shipping_costsがない場合は登録できないこと" do
      item = build(:item, shipping_costs: nil)
      item.valid?
      expect(item.errors[:shipping_costs]).to include("can't be blank")
    end

    it "shipping_fromがない場合は登録できないこと" do
      item = build(:item, shipping_from: nil)
      item.valid?
      expect(item.errors[:shipping_from]).to include("can't be blank")
    end

    it "shipping_dateがない場合は登録できないこと" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("can't be blank")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

  end
end