class Passenger < ApplicationRecord
  belongs_to :booking
  validates :name, :email, presence: true

  delegate :flight, to: :booking
end
