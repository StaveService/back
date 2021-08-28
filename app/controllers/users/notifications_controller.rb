module Users
  class NotificationsController < ApiController
    def update
      Notification.find(params[:id]).mark_as_read!
    end
  end
end
