class Kite < ApplicationRecord
  belongs_to :brand
  has_many :kite_parameters
end
