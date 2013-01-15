require File.dirname(__FILE__) + "/adapters/splunk"

module Yell
  module Adapters
    register(:splunk, Yell::Adapters::Splunk)
  end
end