class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stores
  has_many :groups
  has_many :memberships
  has_many :participated_groups, through: :memberships, source: :group
  
  validates :nickname, presence: true

  def join!(group)
    participated_groups << group
  end

  def quit!(group)
    participated_groups.delete(group)
  end

  def member?(group)
    participated_groups.include?(group)
  end
end
