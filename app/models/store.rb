class Store < ApplicationRecord
  belongs_to :user

  validates :name, :city, :district, :tel, presence: true
end
