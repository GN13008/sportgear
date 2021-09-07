class SportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @sport = Sport.find(params[:id])
    @sport_lvl = traduction_sport_lvl(params[:locale])
    @weights = ["< 55 kg", "55-65 kg", "65-75 kg", "75-85 kg", "85-95 kg", "> 95 kg"]
    @path = path_selector(@sport.name)
  end

  private

  def path_selector(sport)
    case sport
    when "Kite"
      kitesurf_search_path
    # when "Kitefoil"
    #   kitefoil_search_path
    when "Wing"
      wingfoil_search_path
    end
  end

  def traduction_sport_lvl(lg)
    if lg == "fr"
      ["Débutant", "A l'aise", "Pro"]
    else
      ["Beginner", "Regular", "Athletic"]
    end
  end
end
