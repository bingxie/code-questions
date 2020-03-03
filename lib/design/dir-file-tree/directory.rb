require_relative 'entry.rb'
require_relative 'my_file.rb'

class Directory < Entry
  def initialize(name, parent = nil)
    super

    @contents = []
    @parent.add_content(self) if @parent
  end

  def self.root_dir
    Directory.new('./')
  end

  def pathname
    if @parent
      @parent.pathname + @name + '/'
    else
      @name
    end
  end

  def add_content(entry)
    @contents.push entry
  end

  def contents
    @contents.each do |entry|
      p entry.pathname
      entry.contents if entry.dir?
    end
  end

  def dir?
    true
  end
end

root_dir = Directory.root_dir
dir = Directory.new('abc', root_dir)
p dir.pathname
p dir.created

file = MyFile.new('bbb.rb', dir)
p file.pathname
p file.created
p file.parent.parent.pathname

p '---------------'
dir.contents
p '-----------------'
root_dir.contents
