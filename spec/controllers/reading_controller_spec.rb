require 'rails_helper'

RSpec.describe ReadingsController, type: :controller do
  let!(:thermostat)  {create(:thermostat)}
  let(:reading)  {create(:reader)}

  it "renders the #index action" do
    get :index
    expect(response).to be_success
    expect(response.code).to eq('200')
    expect(response.content_type).to eq('text/html')
  end

  describe 'POST /readings' do
    context 'when household token not present' do
      it "return Unauthorised message" do
        post :create, params: { temperature: "55.4", humidity: "28", battery_charge: "1450" }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["message"]).to eq('Please provide household token.')
      end
    end

    context 'when household token is invalid' do
      it "return household token invalid message" do
        post :create, params: { household_token: 'abc', temperature: "55.4", humidity: "28", battery_charge: "1450" }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["message"]).to eq('Household token is invalid !')
      end
    end

    context 'when household token is valid but params are missing' do
      it "return errors message" do
        post :create, params: { household_token: thermostat.household_token, battery_charge: "1450" }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["message"]).to eq('Please check paramaters and values should be present.')
      end
    end

    context 'when household token is valid and all params peresent' do
      it "return success" do
        post :create, params: { household_token: thermostat.household_token, temperature: "55.4", humidity: "28", battery_charge: "1450"}
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET /readings/:id' do
    context 'when household token not present' do
      it "return Unauthorised message" do
        get :show, params: { id: reading.id }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["message"]).to eq('Please provide household token.')
      end
    end

    context 'when household token present' do
      it "renders a reading for a particular thermostat" do
        get :show, params: { household_token: thermostat.household_token, id: reading.id }
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end
  end
end
