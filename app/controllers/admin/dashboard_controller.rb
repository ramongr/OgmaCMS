class Admin::DashboardController < Admin::AdminController
  authorize_resource class: false

  def index
  end
end
