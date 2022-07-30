class Meal < ApplicationRecord
  belongs_to :store

  validates :name, :price, presence: true

  default_scope { order('updated_at DESC') }

end
