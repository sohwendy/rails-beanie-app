class Device < ApplicationRecord
  USERS = [['ux', 'Usability Lab'], ['dev', 'Project'], ['demo', 'Showcase']]
  OSS = { ios: 'iOS', android: 'Android', others: 'Other OS'}
  BRAND = [['Apple', 'apple'], ['Samsung', 'samsung'], ['LG', 'lg']]

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates :name, :manufacturer, :model, :operating_system, :users, :udid, :purchase_date, presence: true
end
