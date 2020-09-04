FactoryBot.define do
  factory :thermostat do
    household_token { SecureRandom.uuid }
    location { "Munich" }
  end
end
