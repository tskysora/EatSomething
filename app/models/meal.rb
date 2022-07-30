class Meal < ApplicationRecord
  belongs_to :store

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0}

  default_scope { order('updated_at DESC') }

end
