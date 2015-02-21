class LogEntriesController < ApplicationController
  def show

  end

  def recent_log_entries
    count = current_teleporter.log_entries.where("created_at > ?", 1.seconds.ago).group_by_second(:created_at).count.values.sum
    render json: { "count" => count }
  end

  def log_entries_by_minute
    render json: current_teleporter.log_entries.group_by_minute(:created_at).count
  end


end
