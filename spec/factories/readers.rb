FactoryBot.define do
  factory :reader do
    number { Reader.next_number }
    temperature { Faker::Number.decimal(2) }
    humidity { Faker::Number.decimal(2) }
    battery_charge { Faker::Number.decimal(2) }
    thermostat
  end
end
