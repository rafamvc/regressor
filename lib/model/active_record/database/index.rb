module Regressor
  module Model
    module Database
      module Index
        def indices
          return if Regressor.configuration.excluded_features.include?("#{self.class}.#{__method__}")
          ::ActiveRecord::Base.connection.indexes(@model.constantize.table_name).map do |indexes|
            "it { is_expected.to have_db_index #{indexes.columns} }"
          end.flatten.join("\n  ")
        end
      end
    end
  end
end