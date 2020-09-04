require 'rails_helper'

RSpec.describe Thermostat, type: :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(build(:thermostat)).to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:readers) }
  end

  describe 'validation' do
    it { should validate_presence_of(:household_token) }
    it { should validate_uniqueness_of(:household_token) }
    it { should validate_presence_of(:location) }
  end

  it "invalid without a household_token" do
    expect(build(:thermostat, household_token:nil)).to_not be_valid
  end

  it "invalid without a location" do
   expect(build(:thermostat, location:nil)).to_not be_valid
  end
end
