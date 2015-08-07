require 'test_helper'

class StopoverTest < ActiveSupport::TestCase
  test 'class variables' do
    assert_equal false, Stopover.disable_hook_assets_precompile
    assert_equal 'stopover', Stopover.layout_name
    assert_equal 'stopover', Stopover.view_path
  end
end
