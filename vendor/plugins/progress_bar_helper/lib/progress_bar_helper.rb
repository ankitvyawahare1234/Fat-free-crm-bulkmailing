require_relative 'engine'
require_relative 'helper'
ActionView::Base.send :include, ProgressBarHelper::Helper

