class Store < ApplicationRecord
  acts_as_paranoid

  extend FriendlyId
  friendly_id :code_generator, use: :slugged
  
  belongs_to :user
  has_many :meals
  has_many :events
  accepts_nested_attributes_for :meals, reject_if: :all_blank, allow_destroy: true
  has_one_attached :menu

  validates :name, :county, :district, :tel, presence: true
  validates :slug, uniqueness: true

  scope :available, -> { where(online: true)}
  scope :disable, -> { where(online: false)}
  default_scope { order('updated_at DESC') }

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
  
  private
  def code_generator
    "#{name} - #{SecureRandom.hex[0,8]}"
  end
end
