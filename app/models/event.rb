class Event < ActiveRecord::Base
  attr_accessible :address, :city, :country, :date, :event_id, :event_type, :latitude, :longitude, :name, :ItemCount, :Actor
    
  validates :address, presence: true
  validates :date, presence: true
  validates :name, presence: true
  validates :event_type, presence: true
  validates :event_id, presence: true
  validates :city, presence: true
  validates :country, presence: true
  
   def full_address
    [address, city, country].compact.join(', ')
  end
  
  geocoded_by :full_address, :if => :check_address_changed?
  after_validation :geocode
  
  def check_address_changed?
    address_changed?
  end
  
  
end
