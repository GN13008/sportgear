class KitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :search, :show ]

  def search
    @usr_lvl = "You did not say your lvl in other watersports / boardsports ! Here are all the kite we could recommend to a Beginner 🔥"
    @usr_weight = "12 and 9 are the standard quiver but you should fill your weights to have more relevant suggestions !"
    @kites = Kite.all
    @size_range_12_19 = 12
    @size_range_19_25 = 9
    if params[:sport_lvl].present?
      if params[:sport_lvl] == "Beginner"
        @usr_lvl = "You say that you have a #{params[:sport_lvl]} lvl in other watersports / boardsports ? This selection is fully dedicated to your lvl ! Enjoy 🔥"
      else
        @usr_lvl = "You say that you have a #{params[:sport_lvl]} lvl in other watersports / boardsports ? It's why we have select some gear that could suit you and that you could keep for a long time 🔥"
      end
      accessibility = accessibility_filter(params[:sport_lvl])
      @search_kites = @kites.select do |kite|
        kite if kite.kite_parameters[0].rate > accessibility
      end
      @kites = @search_kites
    end
    if params[:weights].present?
      size_factor = size_finder(params[:weights], params[:sport_lvl])
      @size_range_12_19 = 12 + size_factor
      @size_range_19_25 = 9 + size_factor
      @usr_weight = "As a rider of #{params[:weights]}, you will need a #{@size_range_12_19} and a #{@size_range_19_25} !"
    end

  end

  def show
    @kite = Kite.find(params[:id])
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    # @markers = @flats.geocoded.map do |flat|
    #   {
    #     lat: flat.latitude,
    #     lng: flat.longitude
    #   }
    @markers = [{ lat: 43.252799, lng: 5.374653,  info_window: render_to_string(partial: "info_window", locals: { kite: @kite }) }]
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

  def size_finder(weights, lvl)
    size_factor = 0
    lvl = "Beginner" if lvl == ""
    size_factor -= 1 if lvl == "Beginner"
    case weights
    when "< 55 kg"
      size_factor -= 3
    when "55-65 kg"
      size_factor -= 2
    when "65-75 kg"
      size_factor -= 1
    when "75-85 kg"
      # this is my reference to choose kite size
    when "85-95 kg"
      size_factor += 1
    when "> 95 kg"
      size_factor += 2
    end
    return size_factor
  end
end
