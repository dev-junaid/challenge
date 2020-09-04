require 'rails_helper'

RSpec.describe Reader, type: :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(build(:reader)).to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:thermostat) }
  end

  describe 'validation' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:temperature) }
    it { should validate_presence_of(:humidity) }
    it { should validate_presence_of(:battery_charge) }
  end
end
