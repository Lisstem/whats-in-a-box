# frozen_string_literal: true

require_relative 'booster_data'

##
#
class TemplateCompiler
  def self.compile(filename, box_data, target_filename)
    erb = ERB.new(File.read(filename), trim_mode: '<>')
    target_filename ||= filename.split('.')[0...-1].join('.')
    file = File.open(target_filename, 'w')
    file.write erb.result(binding)
    file.close
  end
end
