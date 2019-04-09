module Regressor
  module Model
    module Nested
      module Attribute
        def nested_attributes
          return if Regressor.configuration.excluded_features.include?("#{self.class}.#{__method__}")
          if @model.constantize.nested_attributes_options.present?
            @model.constantize.nested_attributes_options.keys.map do |key|
              "it { is_expected.to accept_nested_attributes_for :#{key} }"
            end.join("\n  ")
          end
        end
      end
    end
  end
end
