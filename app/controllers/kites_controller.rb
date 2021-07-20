class KitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :search ]

  def search
    @kites = Kite.all
    @usr_lvl = params[:sport_lvl]
    @usr_weight = params[:weights]
  end
end
