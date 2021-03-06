module Regressor
  module Model
    module Database
      module Column
        def columns
          puts Regressor.configuration.excluded_features
          puts "#{self.class}.#{__method__}"
          return if Regressor.configuration.excluded_features.include?("#{self.class}.#{__method__}")
          @model.constantize.columns.map(&:name).map do |column|
            "it { is_expected.to have_db_column :#{column} }"
          end.join("\n  ")
        end
      end
    end
  end
end