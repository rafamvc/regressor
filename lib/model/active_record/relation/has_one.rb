module Regressor
  module Model
    module Relation
      module HasOne
        def has_one_relations
          return if Regressor.configuration.excluded_features.include?("#{self.class}.#{__method__}")
          @model.constantize.reflect_on_all_associations(:has_one).map(&:name).map do |relation|
            "it { is_expected.to have_one :#{relation} }"
          end.join("\n  ") rescue nil
        end
      end
    end
  end
end