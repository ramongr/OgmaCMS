class StaticController < ApplicationController
  layout 'homepage'
  
  def index
    @top_sidebars = Sidebar.top
    @bottom_sidebars = Sidebar.bottom
    @left_sidebars = Sidebar.left
    @right_sidebars = Sidebar.right
  end
end
