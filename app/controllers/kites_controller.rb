class KitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :search, :show ]

  def search
    @usr_lvl = "You did not say your lvl in other watersports / boardsports ! Here are all the kite we could recommend to a Beginner 🔥"
    @usr_weight = "You did not say your weights. This following sizes are based on a 75-85 kg Rider. Don't hesitate, fill your weights to have more relevant suggestions !"
    @kites = Kite.all
    @size_range_11_15 = 13
    @size_range_16_20 = 11
    @size_range_20_26 = 9
    @size_range_27_35 = 7
    @twin_size = "138 x 41"
    if params[:sport_lvl].present?
      if params[:sport_lvl] == "Beginner"
        @usr_lvl = "You say that you have a #{params[:sport_lvl]} lvl in other watersports / boardsports. This selection is fully dedicated to your lvl ! Enjoy 🔥"
      else
        @usr_lvl = "You say that you have a #{params[:sport_lvl]} lvl in other watersports / boardsports. It's why we have select some gear that could suit you and that you could keep for a long time 🔥"
      end
      accessibility = accessibility_filter(params[:sport_lvl])
      @search_kites = @kites.select do |kite|
        kite if kite.kite_parameters.where(name: "accessibility").first.rate > accessibility
      end
      @kites = @search_kites
    end
    if params[:weights].present?
      size_factor = size_finder(params[:weights], params[:sport_lvl])
      @size_range_11_15 = 13 + size_factor
      @size_range_16_20 = 11 + size_factor
      @size_range_20_26 = 9 + size_factor
      @size_range_27_35 = 7 + size_factor
      @usr_weight = "This following sizes are based on your weights (#{params[:weights]}):"
      @twin_size = twin_finder(params[:weights])
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

  def twin_finder(weights)
    case weights
    when "< 55 kg"
      size = "130 x 38"
    when "55-65 kg"
      size = "130 x 38"
    when "65-75 kg"
      size = "134 x 40"
    when "75-85 kg"
      size = "138 x 41"
    when "85-95 kg"
      size = "142 x 43"
    when "> 95 kg"
      size = "151 x 44"
    end
    return size
  end
end
