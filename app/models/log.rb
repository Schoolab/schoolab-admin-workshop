class Log < ApplicationRecord
  belongs_to :project

  acts_as_paranoid
  audited
end
