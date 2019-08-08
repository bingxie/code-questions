=begin
Assume:

  - No CSV metacharacters in the names in our CSV (no "," or "\n")
  - Valid input.
  - 1:1 mapping between a person and a name.

1st task: parse this CSV. For each line of input, print "#{name} is the child of #{parent1} and #{parent2}"
=end
CSV = <<-CSV
Name,Parent1,Parent2
Chris,Bret,Annie
Daphne,Chris,Emily
Fred,Chris,Emily
Henry,George,Daphne
Ivy,George,Daphne
Jack,George,Daphne
CSV

class FamilyRelationship
  attr_reader :relation
  def initialize(csv)
    @relation = {}
    lines = csv.split
    lines[1..-1].each do |line|
      names = line.split(',')
      puts "#{names[0]} is the child of #{names[1]} and #{names[2]}"
      @relation[names[0]] = names[1..-1]
    end
  end

=begin
Returns a symbol describing how name1 relates to name2. Valid values:

  - :child
  - :parent
  - :ancestor
  - :offspring
  - :unknown
=end
  def describe_relationship(name1, name2)
    name1_ancestors = []
    build_ancestor(name1, name1_ancestors)
    name2_index = name1_ancestors.index(name2)
    if name2_index
      return name2_index < 2 ? :child : :offspring
    end

    name2_ancestors = []
    build_ancestor(name2, name2_ancestors)
    name1_index = name2_ancestors.index(name1)

    if name1_index
      return name1_index < 2 ? :parent : :ancestor
    end

    :unknown
  end

  private

  def build_ancestor(name, ancestors)
    relation[name]&.each do |parent|
      ancestors << parent
      build_ancestor(parent, ancestors)
    end
  end
end

relationship = FamilyRelationship.new(CSV)
puts relationship.describe_relationship("Daphne", "Chris") # => :child
puts relationship.describe_relationship("Chris", "Daphne") # => :parent
puts relationship.describe_relationship("Chris", "Henry") # => :ancestor
puts relationship.describe_relationship("Annie", "Jack") # => :ancestor

puts relationship.describe_relationship("Jack", "Annie") # => :offspring

puts relationship.describe_relationship("Fred", "Henry") # => :unknown
puts relationship.describe_relationship("Foo", "Bar") # => :unknown