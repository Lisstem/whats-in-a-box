# frozen_string_literal: true

require 'active_support/dependencies/autoload'
require 'active_support/number_helper'

module NumberFormatHelper
  def positive_entry?(hash, key)
    !hash[key].nil? && hash[key].is_a?(Numeric) && hash[key].positive?
  end

  def format_numbers_from_hash(hash, *keys)
    number = 0.0
    keys.each do |key|
      number += hash[key] if positive_entry? hash, key
    end
    if number.positive?
      ActiveSupport::NumberHelper.number_to_rounded(number, precision: 4, strip_insignificant_zeros: true)
    else
      '-'
    end
  end

  %i[boosters rare mythic list].each do |rarity|
    define_method rarity do |box_data|
      format_numbers_from_hash(box_data, rarity)
    end
  end

  %i[common uncommon].each do |rarity|
    define_method rarity do |box_data|
      special = "special_#{rarity}".to_sym
      "#{format_numbers_from_hash(box_data, rarity, special)}#{
        " (#{format_numbers_from_hash(box_data, special)} with special frame)" if positive_entry? box_data, special}"
    end
  end

  def land(box_data)
    "#{format_numbers_from_hash(box_data, :land, :foil_land)}#{
      " (#{format_numbers_from_hash(box_data, :foil_land)} foils)" if positive_entry? box_data, :foil_land}"
  end

  def art(box_data)
    "#{format_numbers_from_hash(box_data, :art, :signed_art)}#{
      " (#{format_numbers_from_hash(box_data, :signed_art)} signed)" if positive_entry? box_data, :signed_art}"
  end

  def foil(box_data)
    "#{format_numbers_from_hash(box_data, :foil_random, :foil_land)}#{
      " (at least #{format_numbers_from_hash(box_data, :foil_land)} lands)" if positive_entry? box_data, :foil_land}"
  end
end
