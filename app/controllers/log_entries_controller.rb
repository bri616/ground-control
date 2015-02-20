class LogEntriesController < ApplicationController

  def recent_log_entries
    count = current_teleporter.log_entries.where("created_at > ?", 1.seconds.ago).group_by_second(:created_at).count.values.sum
    render json: { "count" => count }
  end


end
