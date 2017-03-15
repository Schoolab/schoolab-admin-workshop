class Season < ApplicationRecord
  belongs_to :program
  has_many :projects

  acts_as_paranoid
  audited

  def self.collection_for_select
    collection = []
    Program.all.each do |program|
      program.seasons.each do |season|
        collection.push [program.name + ' - ' + season.name, season.id]
      end
    end
    return collection
  end

end
