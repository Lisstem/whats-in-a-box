require 'yaml'

def box(data)
  pack(data[:cards]).transform_values! { |count| data[:booster] * count }
end

def pack(data)
  pack = {}
  data&.each {|slot| add_slot(pack, slot) }
  pack
end

def add_slot(pack, data)
  if data.respond_to? :each_pair
    data.each_pair {|percentage, data| add_card_option(pack, percentage, data) }
  else
    add_card(pack, data)
  end
end

def add_card_option(pack, percentage, data)
  if percentage.is_a? Numeric
    if data.respond_to? :each_pair
      data.each_pair {|type, count| add_card(pack, type, count, factor: percentage) }
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

booster = YAML.load_file 'booster.yaml'

box = {}
booster.each_pair {|type, data| box[type] = box(data)}
puts box.to_yaml


