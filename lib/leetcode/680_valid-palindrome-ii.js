/**
 * @param {string} s
 * @return {boolean}
 */
var validPalindrome = function(s) {
  let head = 0;
  let tail = s.length - 1;
  // 'c bbc c'
  while (head < tail) {
    if (s[head] != s[tail]) {
      return (
        isPalindrome2(s.substring(head + 1, tail + 1)) ||
        isPalindrome2(s.substring(head, tail))
      );
    } else {
      head++;
      tail--;
    }
  }

  return true;
};

function isPalindrome(str) {
  console.log(str);

  return (
    str ===
    str
      .split("")
      .reverse()
      .join("")
  );
}

function isPalindrome2(str) {
  let head = 0;
  let tail = str.length - 1;

  while (head < tail) {
    if (str[head] !== str[tail]) {
      return false;
    } else {
      head++;
      tail--;
    }
  }
  return true;
}

console.log(isPalindrome("abbbbbac"));

let result = validPalindrome("cbbcc");
console.log(result);
