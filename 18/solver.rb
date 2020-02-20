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
  def initialize(string)
    @rows = string.split("\n")
  end

  def width
    @rows.first.length
  end
end

class Solver
  def self.solve_file(file_path)
    file = File.read(file_path)
  end

  def self.solve_maze(maze)
  end
end
