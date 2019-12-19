/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */
const maxPathSum = function(root) {
  let res = Number.MIN_SAFE_INTEGER;
  const dfs = function(node) {
    if (!node) {
      return 0;
    }

    let left = Math.max(0, dfs(node.left));
    let right = Math.max(0, dfs(node.right));

    res = Math.max(res, left + node.val + right);

    return Math.max(left, right) + node.val;
  };

  dfs(root);

  return res;
};
