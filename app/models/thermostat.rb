class Thermostat < ApplicationRecord
  has_many :readers, dependent: :destroy

  validates :household_token, presence: true, uniqueness: true
  validates :location, presence: true

  def self.fetch_by_household_token token
    self.find_by(household_token: token)
  end
end
