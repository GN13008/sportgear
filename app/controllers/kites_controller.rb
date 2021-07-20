class KitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :search ]

  def search
    @usr_lvl = "YOOOOOOOO"
    @usr_weight = "YOOOOOOOO"
    @kites = Kite.all
    if params[:sport_lvl].present?
      @usr_lvl = params[:sport_lvl]
      accessibility = 1
      accessibility = 7 if @usr_lvl == "Beginner"
      @search_kites = @kites.select do |kite|
        kite if kite.kite_parameters[0].rate > accessibility
      end
      @kites = @search_kites
    end
    @usr_weight = params[:weights]
  end
end
