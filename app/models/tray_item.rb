class TrayItem < ApplicationRecord
  belongs_to :tray
  belongs_to :meal

  validates :quantity, presence: true, numericality: { greater_than: 0}
end
