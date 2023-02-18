class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, dependent: :destroy
  validates :passengers, presence: true
  accepts_nested_attributes_for :passengers, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? }
end
