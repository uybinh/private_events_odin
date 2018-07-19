class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  def formatted_date
    date.strftime("%B %d, %Y")
  end
end
