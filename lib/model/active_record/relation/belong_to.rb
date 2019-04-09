module Regressor
  module Model
    module Relation
      module BelongTo
        def belong_to_relations
          return if Regressor.configuration.excluded_features.include?("#{self.class}.#{__method__}")
          @model.constantize.reflect_on_all_associations(:belongs_to).map(&:name).map do |relation|
            "it { is_expected.to belong_to :#{relation} }"
          end.join("\n  ")
        end
      end
    end
  end
end