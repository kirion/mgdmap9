class Events < ActiveRecord::Base
  attr_accessible :address, :city, :country, :date, :event_id, :event_type, :latitude, :longitude, :name
  
   def full_address
    [address, city, country].compact.join(', ')
  end
  
  geocoded_by :full_address, :if => :check_address_changed?
  after_validation :geocode
  
  def check_address_changed?
    address_changed?
  end
  
  
end
