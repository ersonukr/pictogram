class NotificationsController < ApplicationController


  def index
    @notifications = current_user.notifications
  end

  def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
    redirect_to article_path @notification.article
  end

end
