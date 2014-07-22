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
      
      @events_cube = Event.all(:conditions => ["event_type = ?", "Куб"])
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
      
      @events_dvor = Event.all(:conditions => ["event_type = ?", "Встреча во дворе"])
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
      
        @events_dom_list = Event.all(:conditions => ["event_type = ?", "Дом-листовки"])
        @gmapdomlist = Gmaps4rails.build_markers(@houses) do |house, marker|
        marker.lat house.latitude
        marker.lng house.longitude
        marker.picture({:url => "assets/24p-gray-home-icon.png", :width => 24, :height => 24 })
        marker.infowindow "<p><b>Пока событий не было</b><br></p>"  
        marker.title   "#{house.name}"
        marker.json({cat: "House"})
        
        
        @events_dom_list.map.each do |event|
          if house.address == event.address
            if event.ItemCount / house.n_flats.to_f >= 1              
                marker.picture({:url => "assets/24p-violet-home-icon.png", :width => 24, :height => 24 })
            end
            if event.ItemCount / house.n_flats.to_f < 1   
                if event.ItemCount / house.n_flats.to_f > 0.15
                  marker.picture({:url => "assets/24p-yellow-home-icon.png", :width => 24, :height => 24 })
                end
            end      
            if event.ItemCount / house.n_flats.to_f <= 0.15   
                marker.picture({:url => "assets/24p-gray-home-icon.png", :width => 24, :height => 24 })
            end  
            
            marker.infowindow "<p><b>#{event.name}</b><br>
                            Отв.: <b>#{event.Actor}</b><br>
                            Волна: <b>#{event.event_id}</b><br>
                            Кол-во листовок: <b>#{event.ItemCount}</b><br>
                            Кол-во квартир: <b>#{house.n_flats}</b><br>
                            Время проведения: <b>#{event.date}</b><br>
                            Место проведения <b>#{event.address}</b></p>"   
            
            marker.title   "#{event.name}"
            marker.json({cat: event.event_type})
          end
         end            
      end  
  end
end
