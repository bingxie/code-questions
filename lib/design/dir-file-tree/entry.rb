class Entry
  attr_accessor :name, :parent, :created

  def initialize(name, parent = nil)
    @name = name
    @parent = parent
    @created = Time.now
  end

  def pathname
  end

  def delete

  end
end
