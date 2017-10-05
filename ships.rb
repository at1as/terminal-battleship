class Ships
  attr_accessor :carrier, :battleship, :cruiser, :submarine, :destroyer

  def initialize
    @carrier    = {size: 5, health: 5, placed: false, position: [], symbol: :C, name: :carrier}
    @battleship = {size: 4, health: 4, placed: false, position: [], symbol: :b, name: :battleship}
    @cruiser    = {size: 3, health: 3, placed: false, position: [], symbol: :c, name: :cruiser}
    @submarine  = {size: 3, health: 3, placed: false, position: [], symbol: :s, name: :submarine}
    @destroyer  = {size: 2, health: 2, placed: false, position: [], symbol: :d, name: :destroyer}
  end

  def all_ships
    [
      @carrier,
      @battleship,
      @cruiser,
      @submarine,
      @destroyer
    ]
  end

  def ship_at_position(x, y)
    all_ships.each do |ship|
      return ship if ship[:position].any? { |x1, y1| x1 == x && y1 == y }
    end

    nil
  end

  def live_ships
    all_ships.select { |ship| ship[:health] > 0 }
  end

  def hit(ship)
    ship[:health] -= 1
  end
end
