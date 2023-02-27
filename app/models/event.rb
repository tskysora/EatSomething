class Event < ApplicationRecord
  belongs_to :store
  belongs_to :group
  belongs_to :user
  has_one :tray, dependent: :destroy

  validates :date, :period, presence: true

  PERIOD = ["breakfast", "lunch", "dinner"]
  validates_inclusion_of :period, :in => PERIOD

  extend FriendlyId
  friendly_id :code_generator, use: :slugged

  def expired?(date)
    # date < Time.zone.now
    date < 1.day.ago
  end

  def unexpired?(date)
    # date < Time.zone.now
    date > 1.day.ago
  end

  private
  def code_generator
    "#{period} - #{SecureRandom.hex[0,20]}"
  end
end
