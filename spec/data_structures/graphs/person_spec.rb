require 'spec_helper'

RSpec.describe Person do
  it '' do
    alice = Person.new('alice')
    bob = Person.new('bob')
    candy = Person.new('candy')
    derek = Person.new('derek')
    fred = Person.new('fred')
    helen = Person.new('helen')
    gina = Person.new('gina')

    alice.add_friend(bob)
    alice.add_friend(candy)
    alice.add_friend(derek)

    bob.add_friend(fred)
    fred.add_friend(helen)

    derek.add_friend(gina)

    alice.display_network
  end
end
