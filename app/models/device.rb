class Device < ApplicationRecord

  # for windows
  serialize :users

  USERS = [['ux', 'Usability Lab'], ['dev', 'Project'], ['demo', 'Showcase']]
  OSS = { ios: 'iOS', android: 'Android', others: 'Other OS'}
  BRAND = [['Apple', 'apple'], ['Samsung', 'samsung'], ['LG', 'lg']]

  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_attachment_size :photo, less_than: 20.kilobytes

  validates :name, :brand, :model, :operating_system, :users, :udid, :purchase_date, presence: true
end
