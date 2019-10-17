/**
 * @param {string} s
 * @return {boolean}
 */
var isPalindrome = function(s) {
  let head = 0;
  let tail = s.length - 1;
  const regex = /[a-z0-9]/i;

  while (head <= tail) {
    if (!regex.test(s[head])) {
      head++;
    } else if (!regex.test(s[tail])) {
      tail--;
    } else if (s[head].toLowerCase() !== s[tail].toLowerCase()) {
      return false;
    } else {
      head++;
      tail--;
    }
  }
  return true;
};

s = "A man, a plan, a canal: Panama";
console.log(isPalindrome(s));

ss = "raceacar";
console.log(isPalindrome(ss));
