module Yell
  module Adapters
    class Splunk < Yell::Adapters::File
      # Provides us with the :format method
      include Yell::Formatter::Helpers

      VERSION = "1.0.0"

      FORMAT_MAP = {
        level: "L",       # Level, e.g. 'INFO', 'WARN'
        date: "d",        # ISO8601 Timestamp
        hostname: "h",    # Hostname
        pid: "p",         # PID
        progname: "P",    # Progname
        thread_id: "t",   # Thread ID
        file: "F",        # Path with filename where the logger was called
        method: "M",      # Method name where the logger was called
        line: "n"         # Line number
      }
        
      # Setup is called in your adapters initializer. You are not required to
      # define this method if you have no need for special settings. However, here
      # it's used to set the initial message format.
      setup do |options|
        options[:format] = FORMAT_MAP.map { |k, v| "#{k}=\%#{v}" }.join(',')
        self.format = options[:format]
      end
    end
  end
end