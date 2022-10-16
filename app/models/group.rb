class Group < ApplicationRecord

  has_secure_token :invite_token
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_one :token, class_name: "Invite"
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user
  validates :name, presence: true


  def member?(user)
    users.include?(user)
  end

  def editable?(user)
    user && user == owner
  end
  
end
