class MapController < ApplicationController
   def map
      @houses = House.all
      @gmaphouses = Gmaps4rails.build_markers(@houses) do |house, marker|
      marker.lat house.latitude
      marker.lng house.longitude
      marker.infowindow "<p><b>#{house.name}</b><br>
                        Подъездов: <b>#{house.n_porches}</b><br>
                        Этажей: <b>#{house.n_floors}</b><br>
                        Квартир: <b>#{house.n_flats}</b><br>
                        Жильцов: <b>#{house.n_occupants}</b><br>
                        Ключ: <b>#{house.key}</b><br></p>"
        if house.n_occupants < 4000              
            marker.picture({:url => "assets/24p-green-home-icon.png", :width => 24, :height => 24 })
        end
        if house.n_occupants >= 4000 && house.n_occupants <= 10000
            marker.picture({:url => "assets/24p-blue-home-icon.png", :width => 24, :height => 24 })
        end          
        if house.n_occupants > 10000
            marker.picture({:url => "assets/24p-red-home-icon.png", :width => 24, :height => 24 })
        end
        marker.title   "#{house.name}"
        marker.json({cat: "House"})
       end  
     
      @people = Person.all
      @gmappeople = Gmaps4rails.build_markers(@people) do |person, marker|
      marker.lat person.latitude
      marker.lng person.longitude
      marker.infowindow "<p><b>#{person.name}</b><br>
                        Телефон: <b>#{person.phone}</b><br>
                        email: <b>#{person.email}</b></p>"
                        
      marker.title   "#{person.name}"
      marker.json({cat: person.p_type})
    end  
  end
end
