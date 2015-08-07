require 'test_helper'
require 'minitest/mock'

class RakeTest < ActiveSupport::TestCase
  teardown do
    FileUtils.rm_rf(Dir["#{Rails.public_path}/*"])
  end

  test 'stopover:create' do
    output = Dir.chdir(Rails.root) { `bin/rake stopover:create` }
    assert_match 'Writing /Users/hiro/Desktop/stopover/test/dummy/public/404.html', output
    assert_match 'Writing /Users/hiro/Desktop/stopover/test/dummy/public/test/500.html', output
    assert_equal 3, Dir["#{Rails.public_path}/**/*"].size
  end

  test 'assets:precompile' do
    output = Dir.chdir(Rails.root) { `bin/rake assets:precompile` }
    assert_match 'Writing /Users/hiro/Desktop/stopover/test/dummy/public/404.html', output
    assert_match 'Writing /Users/hiro/Desktop/stopover/test/dummy/public/test/500.html', output
    assert_equal 6, Dir["#{Rails.public_path}/**/*"].size
  end
end
