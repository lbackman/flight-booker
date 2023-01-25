class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers
  validates :passengers, presence: true
  accepts_nested_attributes_for :passengers
end
