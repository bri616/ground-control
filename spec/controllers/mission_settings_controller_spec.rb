require 'rails_helper'

RSpec.describe MissionSettingsController, :type => :controller do

  before (:all) do
    load Rails.root + "db/seeds.rb"
  end

  describe "#current_sound_pattern" do
    it 'returns something' do
      get :current_sound_pattern, :uid => '826dev'
      expect(response.body).to_not be_nil
    end

    it 'response status is 200' do
      get :current_sound_pattern, :uid => '826dev'
      expect(response.status).to eq 200
    end

    it 'returns an array in the json' do
      get :current_sound_pattern, :uid => '826dev'
      expect(JSON.parse(response.body)["sound_pattern"].class).to eq Array
    end

    it 'returns the correct array of sound patterns' do
      uid = "826dev"
      sound_pattern_array = Teleporter.find_by(uid: uid).mission_setting.sound_pattern.sounds.collect(&:file_name)
      get :current_sound_pattern, :uid => uid
      expect(JSON.parse(response.body)["sound_pattern"]).to eq sound_pattern_array
    end
  end

end
