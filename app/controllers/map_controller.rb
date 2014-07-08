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
                        Ключ: <b>#{house.key}</b><br></p>"
                        
        if house.n_flats < 100              
            marker.picture({:url => "assets/24p-green-home-icon.png", :width => 24, :height => 24 })
        end
        if house.n_flats >= 100 && house.n_flats <= 200
            marker.picture({:url => "assets/24p-blue-home-icon.png", :width => 24, :height => 24 })
        end          
        if house.n_flats > 200
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
        if person.p_type == "Волонтер"              
            marker.picture({:url => "assets/24p-48-user-coat-blue-icon.png", :width => 48, :height => 24 })
        end                         
        if person.p_type == "Сторонник"              
            marker.picture({:url => "assets/24p-48-user-coat-red-icon.png", :width => 48, :height => 24 })
        end  
        marker.title   "#{person.name}"
        marker.json({cat: person.p_type})
      end  
      
      @events_cube = Events.find_by_event_type("Куб")
      @gmapcubes = Gmaps4rails.build_markers(@events_cube) do |event, marker|
        marker.lat event.latitude
        marker.lng event.longitude
        marker.infowindow "<p><b>#{event.name}</b><br>
                          Время проведения: <b>#{event.date}</b><br>
                          Место проведения <b>#{event.address}</b></p>"
        marker.picture({:url => "assets/32p-cube-icon.png", :width => 32, :height => 32 })       
        marker.title   "#{event.name}"
        marker.json({cat: event.event_type})
      end  
      
      @events_dvor = Events.find_by_event_type("Встреча во дворе")
      @gmapdvor = Gmaps4rails.build_markers(@events_dvor) do |event, marker|
        marker.lat event.latitude
        marker.lng event.longitude
        marker.infowindow "<p><b>#{event.name}</b><br>
                          Время проведения: <b>#{event.date}</b><br>
                          Место проведения <b>#{event.address}</b></p>"           
        marker.picture({:url => "assets/32p-comments-blue-icon.png", :width => 32, :height => 32 })
        marker.title   "#{event.name}"
        marker.json({cat: event.event_type})
      end        
  end
end
