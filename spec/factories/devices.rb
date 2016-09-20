FactoryGirl.define do
  factory :device_one, class: Device do
    name 'Exploding'
    brand 'samsung'
    model 'Galaxy 7'
    operating_system 'android'
    users ['ux']
    udid '123'
    purchase_date '2016-09-15'
  end

  factory :device_two, class: Device do
    name 'Hissing'
    brand 'apple'
    model 'iPhone 7'
    operating_system 'ios'
    users ['ux']
    udid '456'
    purchase_date '2016-09-15'
  end
end