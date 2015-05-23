module ExtInheritedResources
  extend ActiveSupport::Concern

  included do
    inherit_resources
  end
end
