class Store < ApplicationRecord
  acts_as_paranoid

  extend FriendlyId
  friendly_id :code_generator, use: :slugged
  
  belongs_to :user
  has_many :meals
  accepts_nested_attributes_for :meals, reject_if: :all_blank, allow_destroy: true
  has_one_attached :menu

  validates :name, :city, :district, :tel, presence: true
  validates :slug, uniqueness: true

  scope :available, -> { where(online: true)}
  scope :disable, -> { where(online: false)}
  private
  
  def code_generator
    SecureRandom.hex(6)
  end
end
