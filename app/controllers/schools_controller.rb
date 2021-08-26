class SchoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @schools = School.all
    @markers = @schools.geocoded.map do |school|
      {
        lat: school.latitude,
        lng: school.longitude,
        info_window: render_to_string(partial: "info_window", locals: { school: school })
      }
    end
  end
end
