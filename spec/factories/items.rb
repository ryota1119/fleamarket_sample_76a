FactoryBot.define do
  
  factory :item do
    name           {"MacBook Pro"}
    description    {"1世代前のものです。新しいものを購入したので出品します。"}
    brand          {"Apple"}
    condition      {1}   
    status         {1}   
    shipping_costs {1}   
    shipping_from  {1}   
    shipping_date  {1}   
    price          {10000}
    images {[build(:image)]}
    category_id {400}
  end

end