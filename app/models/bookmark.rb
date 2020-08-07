class Bookmark < ApplicationRecord
  belongs_to :type



  def self.nombre
    type.name
  end
end
