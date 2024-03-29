class Tray < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :tray_items

  accepts_nested_attributes_for :tray_items, allow_destroy: true
end
