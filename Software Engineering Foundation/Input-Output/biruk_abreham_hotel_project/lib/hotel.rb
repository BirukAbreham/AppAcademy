require_relative "room"

class Hotel
  
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each { |room, capacity| @rooms[room] = Room.new(capacity) } 
  end

  def name
    cap_name = @name.split
    cap_name.map!(&:capitalize)
    return cap_name.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    return @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if !self.room_exists?(room_name)
      puts "sorry, room does not exist"
      return
    end
    is_ok = @rooms[room_name].add_occupant(person)
    if is_ok
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.each do |room_name, room|
      if !room.full?
        return true
      end
    end

    return false
  end

  def list_rooms
    @rooms.each do |room_name, room|
      puts "#{room_name} #{room.available_space}"
    end
  end

end
