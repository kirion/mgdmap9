class Person < ActiveRecord::Base
  attr_accessible :address, :city, :country, :fathername, :house_head, :latitude, :longitude, :name, :surname, :p_type
  
  
  def full_address
    [address, city, country].compact.join(', ')
  end
  
  geocoded_by :full_address
  after_validation :geocode
  
end
