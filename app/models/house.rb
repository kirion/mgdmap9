class House < ActiveRecord::Base
  attr_accessible :address, :city, :code, :country, :key, :latitude, :longitude, :n_flats, :n_floors, :n_occupants, :n_porches, :name
  
  validates :address, presence: true
  validates :name, presence: true
  validates :n_flats, presence: true
  validates :city, presence: true
  validates :country, presence: true
  
  has_many :events
  
  
  def full_address
    [address, city, country].compact.join(', ')
  end
  
  geocoded_by :full_address, :if => :check_address_changed?
  after_validation :geocode
  
  def check_address_changed?
    address_changed?
  end
  
   def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
end
