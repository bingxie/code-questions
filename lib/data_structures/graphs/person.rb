class Person
  attr_accessor :name, :friends, :visited

  def initialize(name)
    @name = name
    @friends = []
    @visited = false
  end

  def add_friend(friend)
    @friends << friend
  end

  def display_network
    to_reset = [self]

    queue = [self]

    self.visited = true  #图的链接是双向的，所以要记录是否已经访问过了。

    while queue.any?
      current_vertex = queue.shift
      puts current_vertex.name

      current_vertex.friends.each do |friend|
        unless friend.visited
          queue << friend
          to_reset << friend

          friend.visited = true
        end
      end
    end

    to_reset.each do |node|
      node.visited = false
    end
  end
end
