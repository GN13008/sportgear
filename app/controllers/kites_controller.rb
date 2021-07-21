class KitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :search ]

  def search
    @usr_lvl = "You did not say your lvl in other watersports / boardsports ! Here are all the kite we could recommend to a Beginner 🔥"
    @usr_weight = ""
    @kites = Kite.all
    if params[:sport_lvl].present?
      @usr_lvl = "You say that you have a #{params[:sport_lvl]} lvl in other watersports / boardsports ? It's why we have select some gear that could suit you 🔥"
      accessibility = accessibility_filter(params[:sport_lvl])
      @search_kites = @kites.select do |kite|
        kite if kite.kite_parameters[0].rate > accessibility
      end
      @kites = @search_kites
    end
    if params[:weights].present?
      @usr_weight = " of #{params[:weights]}"
    end
    
  end

  private

  def accessibility_filter(lvl)
    # accessibility 1 Good Kiter only to 10 Beginner
    case lvl
    when "Beginner"
      accessibility = 7
    when "Regular"
      accessibility = 5
    when "Athletic"
      accessibility = 1
    else
      accessibility = 0
    end

    return accessibility
  end
end
