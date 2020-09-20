class Dessert

  attr_reader :type, :amount
  
  def initialize(type, amount)
    raise "Amount must be a number" unless amount.is_a?(Integer)
    @amount = amount
    if @amount > 100
      @type = 'gaint '+ type
    else
      @type = type
    end
  end

end
