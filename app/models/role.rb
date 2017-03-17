class Role < ApplicationRecord
  belongs_to :user
  belongs_to :entity, polymorphic: true

  acts_as_paranoid
  audited

  def self.collection_for_select
    [
      ["Membre", 'member'],
      ["Coach", 'coach'],
      ["Mentor", 'mentor'],
      ["Direceur", 'director']
    ]
  end
end
