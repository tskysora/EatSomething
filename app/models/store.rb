class Store < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :district, presence: true
  validates :tel, presence: true
end
