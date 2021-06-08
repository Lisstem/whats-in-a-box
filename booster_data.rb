# frozen_string_literal: true

require 'yaml'

##
# Methods to load and handle the booster data
module BoosterData
  class << self
    def boxes(data)
      boxes = {}
      data.each_pair { |type, box_data| boxes[type] = box(box_data) }
      boxes
    end

    def box(data)
      box = multiply_pack!(pack(data[:slots]), data[:boosters])
      box[:boosters] = data[:boosters]
      box
    end

    def multiply_pack(pack, factor)
      pack.transform_values { |count| factor * count }
    end

    def multiply_pack!(pack, factor)
      pack.transform_values! { |count| factor * count }
    end

    def pack(data)
      pack = {}
      data&.each { |slot| add_slot(pack, slot) }
      pack
    end

    def add_slot(pack, data)
      if data.respond_to? :each_pair
        data.each_pair { |percentage, slot_data| add_card_option(pack, percentage, slot_data) }
      else
        add_card(pack, data)
      end
    end

    def add_card_option(pack, percentage, data)
      if percentage.is_a? Numeric
        if data.respond_to? :each_pair
          data.each_pair { |type, count| add_card(pack, type, count, factor: percentage) }
        else
          add_card(pack, data, factor: percentage)
        end
      else
        add_card(pack, percentage, data)
      end
    end

    def add_card(pack, type, count = 1.0, factor: 1.0)
      pack[type] ||= 0.0
      pack[type] = pack[type] + factor * count
    end

    def load_file(filename)
      data = YAML.load_file filename
      boxes(data)
    end
  end
end
