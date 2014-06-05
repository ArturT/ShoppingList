# https://github.com/nicksieger/ci_reporter#rails
if ENV['CI_REPORTER']
  require 'ci/reporter/rake/rspec'
  task spec: 'ci:setup:rspecdoc'
end
