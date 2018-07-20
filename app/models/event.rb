class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_setups, foreign_key: "attended_event_id"
  has_many :attendees, through: :event_setups


  class << self
    def past
      where("date <= ?", Time.zone.now)
    end

    def upcomping
      where("date > ?", Time.zone.now)
    end

  end

  def formatted_date
    date.strftime("%B %d, %Y")
  end
end
