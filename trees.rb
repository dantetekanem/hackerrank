require_relative "./easy_tests"

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
tree_empty = Tree.new(nil, nil, nil)

tree_big = Tree.new(10,
  Tree.new(14,
    Tree.new(9,
      Tree.new(15,
        Tree.new(25, nil, nil),
        Tree.new(20, nil, nil)
      ),
      Tree.new(11,
        Tree.new(15, nil, nil),
        nil
      )
    ),
    Tree.new(200,
      Tree.new(89,
        Tree.new(99,
          Tree.new(50, nil, nil),
          nil
        ),
        Tree.new(24,
          Tree.new(26,
            Tree.new(45, nil, nil),
            Tree.new(95, nil, nil)
          ),
          Tree.new(40, nil, nil)
        )
      ),
      Tree.new(19,
        Tree.new(25, nil, nil),
        Tree.new(600, nil, nil)
      )
    )
  ),
  Tree.new(15, nil, nil)
)

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

def solution(s)
  valid_nodes(s, s.x).size
end

easy = EasyTests.new
easy.assert_equal 4, solution(tree_1)
easy.assert_equal 2, solution(tree_2)
easy.assert_equal 0, solution(tree_empty)
easy.assert_equal 20, solution(tree_big)

easy.run
