class Teleporter < ActiveRecord::Base
  belongs_to :user
  has_one :state_setting
  has_one :mission_setting
  has_many :log_entries

  def pattern_list
    log_entries.collect { |log_entry| log_entry.light_directive}.uniq
  end

  def successful_mission_count(pattern)
    log_entries.where("lights_on = true AND light_directive = '#{pattern}'").count
  end

  def missions_per_hour
    log_entries.group_by_hour(:created_at).count
  end

  def successful_missions_per_hour
    log_entries.where(lights_on: true).group_by_hour(:created_at).count
  end
  
end
