class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @sport_lvl = ["Beginner", "regular", "athletic"]
    @weights = ["< 55 kg", "55-70 kg", "70-80 kg", "80-95 kg", "> 95 kg"]
    @winds = ["no idea", "12 to 18 knots", "18 to 25 knots", "12 to 25 knots"]
  end
end
