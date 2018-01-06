class Venue
  include Mongoid::Document
  field :name, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String
  field :zip, type: String
  field :address, type: String
  field :map_coordinates, type: String
  field :capacity, type: Integer
  field :surface, type: String
  field :roof_type, type: String

  belongs_to :team

  # before_save :check_uniqueness

  # protected
  # def check_uniqueness()
  #   if (Venue.exists?(id: self.id))
  #     return false
  #   end
  #   return true
  # end
end
