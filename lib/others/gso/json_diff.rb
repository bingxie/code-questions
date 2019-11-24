require 'json'

expected = {
  id: 9876,
  first_name: 'Tony',
  last_name: 'Soprano',
  account: {
    bank_name: 'Bank Of America',
    account_number: 12345,
    more: {
      size: 1
    }
  }
}

actual = {
  id: 20,
  first_name: 'Tony',
  account: {
    account_number: 12345,
    balance: 500,
    more: {
      size: 2
    }
  }
}

#[
#  [ '-', 'id',                  9876              ],
#   [ '+', 'id',                  20                ],
#   [ '-', 'last_name',           'Soprano'         ],
#   [ '-', 'account.bank_name',   'Bank Of America' ],
#   [ '+', 'account.balance',     500               ]
# ]

def diff_hash(expected, actual, results = [], prefix = nil)
  combined_keys = (expected.keys + actual.keys).uniq  # (expected.keys | actual.keys)

  combined_keys.each do |key|
    next if expected[key] == actual[key]

    if expected[key].is_a?(Hash) && actual[key].is_a?(Hash)
      diff_hash(expected[key], actual[key], results, key_name(prefix, key))
    else
      results << ['-', key_name(prefix, key), expected[key]] if expected[key]
      results << ['+', key_name(prefix, key), actual[key]] if actual[key]
    end
  end

  results
end

def key_name(prefix, key)
  return "#{prefix}.#{key}" if prefix
  key
end

pp diff_hash(expected, actual)
