require 'stopover/engine'

module Stopover
  mattr_accessor(:disable_hook_assets_precompile) { false }
  mattr_accessor(:layout_name) { 'stopover' }
  mattr_accessor(:view_path) { 'stopover' }

  module CustomMethods
  end

  def self.custom_methods(&block)
    Stopover::CustomMethods.module_eval(&block) if block
  end

  def self.setup
    yield self
  end
end
