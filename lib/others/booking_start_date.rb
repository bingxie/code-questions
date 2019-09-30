def booking_start_date(bookings, stay_length, current_date)
  bookings_list = bookings.split
  booking_array = []

  bookings_list.each do |book|
    range = book.split(":")
    (range.first.to_i...range.last.to_i).each do |i|
      booking_array[i] = 1
    end
  end
  p booking_array

  current_date.upto(booking_array.size) do |j|
    next if booking_array[j] == 1
  end
end

booking_start_date('0:2 3:5 7:14', 1, 4)
