class House < ActiveRecord::Base
  attr_accessible :address, :city, :code, :country, :key, :latitude, :longitude, :n_flats, :n_floors, :n_occupants, :n_porches, :name
  
  def full_address
    [address, city, country].compact.join(', ')
  end
  
  geocoded_by :full_address, :if => :check_address_changed?
  after_validation :geocode
  
  def check_address_changed?
    address_changed?
  end
  
end
