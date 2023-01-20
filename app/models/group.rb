class Group < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_one :token, class_name: "Invite", dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user
  has_many :events
  validates :name, presence: true

  extend FriendlyId
  friendly_id :code_generator, use: :slugged

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def editable?(user)
    user && user == owner
  end

  private
  def code_generator
    "#{name} - #{SecureRandom.hex[0,8]}"
  end
end
