# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dev_teleporter = Teleporter.create(name:"bfi-dev", uid:"826dev", description:"Development version of BFI Teleporter")
dev_teleporter.create_state_setting(lights_on:false)
dev_teleporter.create_mission_setting(light_directive:"rainbow")
dev_teleporter.create_user(rank: "Admiral", recovery_email: "bridotson@gmail.com", password: "test", password_confirmation: "test")
