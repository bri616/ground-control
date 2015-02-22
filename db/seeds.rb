# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teleporter.destroy_all
User.destroy_all
StateSetting.destroy_all
MissionSetting.destroy_all
SoundPattern.destroy_all
Sound.destroy_all

sound_list = ["teleport1", "teleport2", "teleport3", "zap1", "caprica", "aliens1", "tesseract", "ftljump", "witch"]

sound_list.each do |sound|
  Sound.create(file_name: sound)
end

dev_teleporter = Teleporter.create(name:"bfi-dev", uid:"826dev", description:"Development version of BFI Teleporter")
dev_teleporter.create_state_setting(lights_on:false)

dev_teleporter.create_mission_setting(light_directive:"oz")
dev_teleporter.mission_setting.create_sound_pattern(name: "Tesseract")

SoundPattern.create(name: "Greenwood Ave").sounds << Sound.find_by(file_name: "teleport1")
SoundPattern.find_by(name: "Greenwood Ave").sounds << Sound.find_by(file_name: "teleport2")
SoundPattern.find_by(name: "Greenwood Ave").sounds << Sound.find_by(file_name: "teleport3")
SoundPattern.find_by(name: "Greenwood Ave").sounds << Sound.find_by(file_name: "zap1")

SoundPattern.create(name: "FTL Jump").sounds << Sound.find_by(file_name: "ftljump")

SoundPattern.create(name: "Corellian Run").sounds << Sound.find_by(file_name: "aliens1")

SoundPattern.create(name: "Yellow Brick Road").sounds << Sound.find_by(file_name: "teleport3")

SoundPattern.find_by(name: "Tesseract").sounds << Sound.find_by(file_name: "tesseract")

SoundPattern.create(name: "Milky Way").sounds << Sound.find_by(file_name: "teleport1")

dev_teleporter.create_user(rank: "Admiral", recovery_email: "bridotson@gmail.com", password: "test", password_confirmation: "test")
