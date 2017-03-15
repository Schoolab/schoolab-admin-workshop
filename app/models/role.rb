class Role < ApplicationRecord
  belongs_to :user
  belongs_to :entity, polymorphic: true

  acts_as_paranoid
  audited
end
