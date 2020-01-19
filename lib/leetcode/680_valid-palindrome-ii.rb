def valid_palindrome(s)
  l = 0
  r = s.length - 1
  @str = s
  while l < r
    return palindrome(l, r - 1) || palindrome(l + 1, r) if s[l] != s[r]

    l += 1
    r -= 1
  end
  true
end

def palindrome(l, r)
  while l < r
    return false if @str[l] != @str[r]

    l += 1
    r -= 1
  end
  true
end
