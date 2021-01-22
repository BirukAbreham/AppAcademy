class Node {
  constructor() {
    this.children = {};
    this.isTerminal = false;
  }
}

class Trie {
  constructor() {
    this.root = new Node();
  }

  insertRecur(word, root = this.root) {
    let letter = word[0];
    if (!(letter in root.children)) {
      root.children[letter] = new Node();
    }

    if (word.length === 1) {
      root.children[letter].isTerminal = true;
    } else {
      this.insertRecur(word.slice(1), root.children[letter]);
    }
  }

  insertIter(word) {
    let head = this.root;
    while (word.length > 0) {
      let letter = word[0];
      if (!(letter in head.children)) {
        head.children[letter] = new Node();
      }

      if (word.length === 1) {
        head.children[letter].isTerminal = true;
      }

      head = head.children[letter];
      word = word.slice(1);
    }
  }

  insertIterSln(word) {
    let node = this.root;

    for (let i = 0; i < word.length; i++) {
      let letter = word[i];

      if (!(letter in node.children)) {
        node.children[letter] = new Node();
      }

      node = node.children[letter];
    }

    node.isTerminal = true;
  }

  searchRecur(word, root = this.root) {
    if (word.length === 0) {
      if (root.isTerminal) {
        return true;
      } else {
        return false;
      }
    }

    let letter = word[0];
    if (letter in root.children) {
      return this.searchRecur(word.slice(1), root.children[letter]);
    } else {
      return false;
    }
  }

  searchIter(word) {
    let head = this.root;

    while (word.length > 0) {
      let letter = word[0];
      if (letter in head.children) {
        head = head.children[letter];
        word = word.slice(1);
      } else {
        return false;
      }
    }

    if (word.length === 0) {
      return head.isTerminal ? true : false;
    }
  }

  searchIterSln(word) {
    let node = this.root;

    for (let i = 0; i < word.length; i++) {
      let letter = word[i];

      if (!(letter in node.children)) {
        return false;
      }

      node = node.children[letter];
    }

    return node.isTerminal;
  }

  wordsWithPrefix(prefix, root = this.root, word = "") {
    let words = [];
    if (prefix === "") {
      if (Object.keys(root.children).length > 0) {
        for (const child in root.children) {
          if (root.isTerminal && root.children[child].isTerminal) {
            words.push(word);
          }
          words.push(
            ...this.wordsWithPrefix(prefix, root.children[child], word + child)
          );
        }
      } else {
        words.push(word + "");
        return words;
      }
    } else {
      let letter = prefix[0];
      if (letter in root.children) {
        words.push(
          ...this.wordsWithPrefix(
            prefix.slice(1),
            root.children[letter],
            word + letter
          )
        );
      }
    }
    return words;
  }

  wordsWithPrefixSln(prefix, root = this.root) {
    if (prefix.length === 0) {
      let allWords = [];

      if (root.isTerminal) allWords.push("");

      for (const letter in root.children) {
        let child = root.children[letter];
        let suffixes = this.wordsWithPrefixSln(prefix, child);
        let words = suffixes.map((suffix) => letter + suffix);
        allWords.push(...words);
      }

      return allWords;
    } else {
      let firstLetter = prefix[0];
      let child = root.children[firstLetter];
      if (!child) {
        return [];
      } else {
        let suffixes = this.wordsWithPrefix(prefix.slice(1), child);
        let words = suffixes.map((suffix) => firstLetter + suffix);
        return words;
      }
    }
  }

  startsWith(prefix, root = this.root) {
    if (prefix === "") return true;

    let letter = prefix[0];
    if (letter in root.children) {
      return this.startsWith(prefix.slice(1), root.children[letter]);
    } else {
      return false;
    }
  }
}

module.exports = {
  Node,
  Trie,
};
