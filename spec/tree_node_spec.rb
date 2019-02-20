require 'spec_helper'
require_relative '../lib/tree_node'

RSpec.describe TreeNode do
  subject(:tree_node) { TreeNode.new(22) }

  it { is_expected.to have_attributes(value: 22) }
end
