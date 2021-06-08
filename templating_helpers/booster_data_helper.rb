# frozen_string_literal: true

# Constants to use in booster templates
module BoosterDataHelper
  FOIL_CHANCE = 1.0 / 3.0
  MYTHIC_CHANCE = 1.0 / 7.4
  RARE_CHANCE = 1.0 - MYTHIC_CHANCE

  SET_SIGNED_ART_CHANCE = 1.0 / 20.0
  SET_FOIL_LAND_CHANCE = 3.0 / 20.0


  constants(false).each do |constant|
    define_method constant.to_s.downcase! do
      BoosterDataHelper.const_get(constant)
    end
  end
end
