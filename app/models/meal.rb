class Meal < ApplicationRecord
  acts_as_list
  
  belongs_to :store

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0}

  acts_as_list scope: [:store_id]
  default_scope { order('position ASC') }

end
