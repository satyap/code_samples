class Role < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user

  scope :admin, -> { where(name: 'admin') }
  scope :user, -> { where(name: 'user') }
  scope :denied, -> { where(name: 'denied') }
end
