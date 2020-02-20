# class Wall
# end
#
# class Key
# end
#
# class Door
# end
#
# class EmptySpace
# end

class Maze
  attr_reader :string, :rows

  def initialize(string)
    @string = string
    @rows = string.split("\n")
  end

  def width
    rows.first.length
  end

  def starting_position
    rows.each_with_index do |row, y|
      x = row.index("@")

      return [x,y] if x
    end
  end

  def keys
    string.scan /[a-z]/
  end

  def value_at(position)
    x, y = position
    rows[y][x]
  end

  def peek(position)
    neighboring_positions = position.yield_self do |x,y|
      [
        [x+1,y],
        [x-1,y],
        [x,y+1],
        [x,y-1],
      ]
    end

    neighboring_positions.select do |x,y|
      rows[y][x] != "#"
    end
  end
end

class Solver
  attr_reader :maze

  def initialize(maze)
    @maze = maze
  end

  def self.solve_file(file_path)
    maze = Maze.new(File.read(file_path))
    self.new(maze).solve
  end

  def solve
    step(maze.starting_position) - 1
  end
  # 2,1->1,1->2,1->1,1
  def step(current_pos, all_past = [], recent_past = [], keys_obtained = [])
    all_past = all_past + [current_pos]
    recent_past = recent_past + [current_pos]
    current_pos_value = maze.value_at(current_pos)

    if current_pos_value.match(/[a-z]/)
      keys_obtained = keys_obtained + [current_pos_value]
      if keys_obtained.length == maze.keys.length
        # puts all_past.map { |e| e.join(",") }.join("->")
        return all_past.length
      end
      recent_past = [current_pos]
    end

    next_possible_positions = maze.peek(current_pos)
    outcomes = next_possible_positions.map do |next_pos|
      next if recent_past.include?(next_pos)
      step(next_pos, all_past, recent_past, keys_obtained)
    end
    outcomes.compact.min
  end
end
