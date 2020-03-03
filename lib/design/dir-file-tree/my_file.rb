require_relative 'entry.rb'

class MyFile < Entry
  def initialize(name, parent)
    super(name, parent)

    if parent.nil? || !parent.dir?
      raise 'Assign a valid dir argument'
    end

    @parent.add_content(self)
  end

  def dir?
    false
  end

  def pathname
    @parent.pathname + @name
  end
end
