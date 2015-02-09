# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teleporter.create(name:"bfi-dev", uid:"826dev", description:"Development version of BFI Teleporter")
Teleporter.first.create_state_setting(lights_on:false)
Teleporter.first.create_mission_setting(light_directive:"rainbow")
