require 'rails_helper'

RSpec.describe MissionSettingsController, :type => :controller do

  before (:all) do
    load Rails.root + "db/seeds.rb"
  end

  describe "#current_sound_pattern" do
    it 'returns something' do
      get :current_sound_pattern, :uid => '826dev'
      expect(response).to_not be_nil
    end

    it 'response status is 200' do
      get :current_sound_pattern, :uid => '826dev'
      expect(response.status).to eq 200
    end
  end

end
