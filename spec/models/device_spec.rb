require 'rails_helper'

RSpec.describe Device, type: :model do

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:model) }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:operating_system) }
  it { is_expected.to validate_presence_of(:users) }
  it { is_expected.to validate_presence_of(:udid) }
  it { is_expected.to validate_presence_of(:purchase_date) }

end