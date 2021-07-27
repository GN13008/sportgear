class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :ui ]

  def home
    @sport_lvl = ["Beginner", "Regular", "Athletic"]
    @weights = ["< 55 kg", "55-65 kg", "65-75 kg", "75-85 kg", "85-95 kg", "> 95 kg"]
  end

  def ui
  end
end
