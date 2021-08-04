module Users
  class NotificationsController < ApplicationController
    def update
      Notification.find(params[:id]).mark_as_read!
    end
  end
end
