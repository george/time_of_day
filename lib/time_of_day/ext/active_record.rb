require 'active_support/core_ext/module/aliasing'
require 'active_record/connection_adapters/abstract/schema_definitions'

module ActiveRecord
  module ConnectionAdapters
    class Column
      class << self
        def string_to_dummy_time_with_time_of_day(string)
          t = string_to_dummy_time_without_time_of_day(string)
          t.respond_to?(:time_of_day) ? t.time_of_day : t
        end
        # don't care if we're not using ActiveRecord
        alias_method_chain(:string_to_dummy_time, :time_of_day) if method_defined?(:string_to_dummy_time)
      end
    end
  end
end