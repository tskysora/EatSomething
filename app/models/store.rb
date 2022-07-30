class Store < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :user
  has_many :meals
  accepts_nested_attributes_for :meals, reject_if: :all_blank, allow_destroy: true

  validates :name, :city, :district, :tel, presence: true
end
