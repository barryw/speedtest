class WelcomeController < ApplicationController
  def index
    @upload_speed = Result.group_by_minute(:created_at).average(:upload_speed)
    @download_speed = Result.group_by_minute(:created_at).average(:download_speed)
  end

end
