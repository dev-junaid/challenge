MAX_RECORDS = 1..10

ActiveRecord::Base.transaction do
  MAX_RECORDS.each do
    Thermostat.create!(
      household_token: SecureRandom.uuid,
             location: Faker::Address.unique.city,
    )
  end

  thermostats = Thermostat.all
  thermostats.each do |thermostat|
    reader = thermostat.readers.build(
              number: Reader.next_number,
         temperature: Faker::Number.decimal(2),
            humidity: Faker::Number.decimal(2),
      battery_charge: Faker::Number.decimal(2)
    )
    reader.save!
  end
end
