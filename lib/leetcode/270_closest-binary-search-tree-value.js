/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @param {number} target
 * @return {number}
 */
let closestValue = function(root, target) {
  let closest = root.val;

  while (root != null) {
    let val = root.val;
    closest =
      Math.abs(val - target) < Math.abs(closest - target) ? val : closest;

    root = target > root.val ? root.right : root.left;
  }

  return closest;
};
