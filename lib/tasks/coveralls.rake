# https://coveralls.io/docs/ruby
if ENV['COVERALLS']
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new
  task test_with_coveralls: [:spec, :features, 'coveralls:push']
end
