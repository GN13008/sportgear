class KitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :search ]

  def search
    @usr_lvl = "You did not say your lvl in other watersports / boardsports ! Here are all the kite we could recommend to a Beginner 🔥"
    @usr_weight = ""
    @kites = Kite.all
    if params[:sport_lvl].present?
      @usr_lvl = "You say that you have a #{params[:sport_lvl]} lvl in other watersports / boardsports ? It's why we have select some gear that could suit you 🔥"
      accessibility = 1
      accessibility = 7 if @usr_lvl == "Beginner"
      @search_kites = @kites.select do |kite|
        kite if kite.kite_parameters[0].rate > accessibility
      end
      @kites = @search_kites
    end
    if params[:weights].present?
      @usr_weight = " of #{params[:weights]}"
    end
    
  end
end
