class Card
  
  attr_reader :face, :face_up, :face_down

  def initialize(face)
    @face = face
    @face_up = false
    @face_down = true
  end

  def hide
    @face_up, @face_down = false, true
  end

  def reveal
    @face_up, @face_down = true, false
  end

  def to_s
    @face.to_s
  end

  def ==(card)
    if self.face == card.face
      return true
    end
    false
  end
  
  def show_face
    if @face_up
      self.to_s
    else
      nil
    end
  end

end
