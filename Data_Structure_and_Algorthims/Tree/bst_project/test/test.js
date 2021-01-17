const chai = require("chai");
chai.use(require("chai-spies"));
const { expect, spy } = chai;

const { TreeNode, BST } = require("../lib/bst");
const { sortedArrayToBST } = require("../lib/leet_code_108");
const { isBalanced } = require("../lib/leet_code_110");

describe("BST", () => {
  describe("#constructor()", () => {
    it("should initialize the `root` property to null", () => {
      let tree = new BST();
      expect(tree).to.have.property("root");
      expect(tree.root).to.equal(null);
    });
  });

  describe("#insert(val)", () => {
    it("should insert a TreeNode with the given value into the BST", () => {
      let tree = new BST();
      tree.insert(10);
      tree.insert(5);
      tree.insert(16);
      tree.insert(1);
      tree.insert(7);
      tree.insert(16);
      expect(tree.root.val).to.equal(10);
      expect(tree.root.left.val).to.equal(5);
      expect(tree.root.right.val).to.equal(16);
      expect(tree.root.left.left.val).to.equal(1);
      expect(tree.root.left.right.val).to.equal(7);
      expect(tree.root.right.right.val).to.equal(16);
    });

    context("when the BST is empty", () => {
      it("should correctly insert a TreeNode with the given val as the root", () => {
        let tree = new BST();
        tree.insert(10);
        expect(tree.root).to.be.instanceOf(TreeNode);
        expect(tree.root.val).to.equal(10);
      });
    });
  });

  describe("#searchRecur(val)", () => {
    let tree;

    beforeEach(() => {
      tree = new BST();
      tree.insert(10);
      tree.insert(5);
      tree.insert(16);
      tree.insert(1);
      tree.insert(7);
      tree.insert(16);
    });

    it("should return false if the BST is empty", () => {
      let emptyTree = new BST();
      expect(emptyTree.searchRecur(10)).to.equal(false);
    });

    it("should be recursive", () => {
      spy.on(tree, "searchRecur");
      tree.searchRecur(7);
      expect(tree.searchRecur).to.have.been.called.above(1);
    });

    context("when the val is contained in the BST", () => {
      it("should return true", () => {
        expect(tree.searchRecur(10)).to.equal(true);
        expect(tree.searchRecur(7)).to.equal(true);
        expect(tree.searchRecur(16)).to.equal(true);
      });
    });

    context("when the val is not contained in the BST", () => {
      it("should return false", () => {
        expect(tree.searchRecur(-4)).to.equal(false);
        expect(tree.searchRecur(1.5)).to.equal(false);
        expect(tree.searchRecur(14)).to.equal(false);
      });
    });
  });

  describe("#searchIter(val)", () => {
    let tree;

    beforeEach(() => {
      tree = new BST();
      tree.insert(10);
      tree.insert(5);
      tree.insert(16);
      tree.insert(1);
      tree.insert(7);
      tree.insert(16);
    });

    it("should return false if the BST is empty", () => {
      let emptyTree = new BST();
      expect(emptyTree.searchIter(10)).to.equal(false);
    });

    it("should not be iterative, not recursive", () => {
      spy.on(tree, "searchIter");
      tree.searchIter(7);
      expect(tree.searchIter).to.have.been.called.once;
    });

    context("when the val is contained in the BST", () => {
      it("should return true", () => {
        expect(tree.searchIter(10)).to.equal(true);
        expect(tree.searchIter(7)).to.equal(true);
        expect(tree.searchIter(16)).to.equal(true);
      });
    });

    context("when the val is not contained in the BST", () => {
      it("should return false", () => {
        expect(tree.searchIter(-4)).to.equal(false);
        expect(tree.searchIter(1.5)).to.equal(false);
        expect(tree.searchIter(14)).to.equal(false);
      });
    });
  });
});

describe("Leet Code #108 https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/", () => {
  context("when the array is length >= 1", () => {
    it("When array is given", () => {
      let root = new TreeNode(0);
      let negThr = new TreeNode(-3);
      let nine = new TreeNode(9);
      let negTen = new TreeNode(-10);
      let fiv = new TreeNode(5);
      root.left = negThr;
      root.right = nine;
      negThr.left = negTen;
      nine.left = fiv;
      bstFromArray = [-10, -3, 0, 5, 9];
      expect(sortedArrayToBST(bstFromArray)).to.eql(root);
    });
  });

  context("when the array is empty", () => {
    it("Should return an a empty list", () => {
      expect(sortedArrayToBST([])).to.eql(null);
    });
  });
});

describe("Leet Code #110 https://leetcode.com/problems/balanced-binary-tree/", () => {
  context("when the tree is empty", () => {
    it("should return true", () => {
      expect(isBalanced(null)).to.equal(true);
    });
  });

  context("when the tree is balanced", () => {
    it("should return true", () => {
      let root = new TreeNode(3);
      let nine = new TreeNode(9);
      let twenty = new TreeNode(20);
      let fifty = new TreeNode(15);
      let seven = new TreeNode(7);
      root.left = nine;
      root.right = twenty;
      twenty.left = fifty;
      twenty.right = seven;
      expect(isBalanced(root)).to.equal(true);
    });
  });

  context("when the tree is not balanced", () => {
    it("should return false", () => {
      let one = new TreeNode(1);
      let two_1 = new TreeNode(2);
      let two_2 = new TreeNode(2);
      let thr_1 = new TreeNode(3);
      let thr_2 = new TreeNode(3);
      let fr_1 = new TreeNode(4);
      let fr_2 = new TreeNode(4);
      one.left = two_1;
      one.right = two_2;
      two_1.left = thr_1;
      two_1.right = thr_2;
      thr_1.left = fr_1;
      thr_1.right = fr_2;
      expect(isBalanced(one)).to.equal(false);
    });
  });
});
