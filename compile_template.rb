# frozen_string_literal: true

require 'erb'

require_relative 'template_compiler'
require_relative 'templating_helpers/number_format_helper'

class MyTemplateCompiler < TemplateCompiler
  extend NumberFormatHelper
end

MyTemplateCompiler.compile(ARGV[0], BoosterData.load_file(ARGV[1]), ARGV[2])
