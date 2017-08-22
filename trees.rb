class Tree
  attr_reader :x, :l, :r

  def initialize(x, l, r)
    @x = x
    @l = l
    @r = r
  end
end

tree_1 = Tree.new(5, Tree.new(3, Tree.new(20, nil, nil), Tree.new(21, nil, nil)), Tree.new(10, Tree.new(1, nil, nil), nil))
tree_2 = Tree.new(8, Tree.new(6, Tree.new(8, nil, nil), nil), Tree.new(2, nil, nil))

def valid_nodes(tree, root, nodes=[])
  nodes << tree.x if tree.x && tree.x >= root

  if tree.l.is_a?(Tree)
    nodes << valid_nodes(tree.l, root)
  end
  if tree.r.is_a?(Tree)
    nodes << valid_nodes(tree.r, root)
  end

  nodes.flatten
end

puts valid_nodes(tree_1, tree_1.x).size
puts valid_nodes(tree_2, tree_2.x).size
