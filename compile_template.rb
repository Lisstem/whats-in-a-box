# frozen_string_literal: true

require 'erb'

require_relative 'template_compiler'
require_relative 'templating_helpers/number_format_helper'
require_relative 'templating_helpers/booster_data_helper'

class MyTemplateCompiler < TemplateCompiler
  extend NumberFormatHelper
  extend BoosterDataHelper
end
booster_data = ARGV[1] && !ARGV[1].empty? ? BoosterData.load_file(ARGV[1]) : nil
MyTemplateCompiler.compile(ARGV[0], booster_data, ARGV[2])
