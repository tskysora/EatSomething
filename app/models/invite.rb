class Invite < ApplicationRecord
  has_secure_token :invite_token
  belongs_to :group
  
  def to_param
    invite_token
  end

end
