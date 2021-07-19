class KitesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :search ]

  def search
    @kites = Kite.all
  end
end
