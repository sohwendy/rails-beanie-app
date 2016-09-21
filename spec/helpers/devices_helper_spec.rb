require 'rails_helper'

RSpec.describe DevicesHelper, type: :helper do

  subject { build(:device_one) }

  context '#' do
    it 'returns operating system text' do
      expect(display_os(subject)).to eq('Android')
    end

    it 'returns user text' do
      expect(display_users(subject)).to eq('Usability Lab')
    end

    it 'returns purchase date text' do
      expect(display_purchase_date(subject)).to eq('15 Sep 2016')
    end

    it 'returns brand list with Select One ' do
      array = ['Select One'] + Device::BRAND
      expect(select_brand).to eq(array)
    end

    it 'returns brand selection ' do
      expect(selected_brand(subject)).to eq('samsung')
    end
  end
end