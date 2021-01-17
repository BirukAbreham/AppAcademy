class TreeNode {
  constructor(val) {
    this.val = val;
    this.left = null;
    this.right = null;
  }
}

class BST {
  constructor() {
    this.root = null;
  }

  insert(val, root = this.root) {
    if (!this.root) {
      this.root = new TreeNode(val);
      return;
    }

    if (val < root.val) {
      if (!root.left) {
        root.left = new TreeNode(val);
      } else {
        this.insert(val, root.left);
      }
    } else {
      if (!root.right) {
        root.right = new TreeNode(val);
      } else {
        this.insert(val, root.right);
      }
    }
  }

  searchRecur(val, root = this.root) {
    if (!root) return false;

    if (val < root.val) {
      return this.searchRecur(val, root.left);
    } else if (val > root.val) {
      return this.searchRecur(val, root.right);
    } else {
      return true;
    }
  }

  searchIter(val, root = this.root) {
    if (!root) return false;

    while (root || root.left || root.right) {
      if (val < root.val) {
        if (root.left) {
          root = root.left;
        } else {
          return false;
        }
      } else if (val > root.val) {
        if (root.right) {
          root = root.right;
        } else {
          return false;
        }
      } else {
        return true;
      }
    }
    return false;
  }

  searchIterSln(val) {
    let curr = this.root;

    while (curr !== null) {
      if (val < curr.val) {
        curr = curr.left;
      } else if (val > curr.val) {
        curr = curr.right;
      } else {
        return true;
      }
    }

    return false;
  }
}

module.exports = {
  TreeNode,
  BST,
};
