function selectionSort(array) {
  for(var i = 0; i < array.length; i++) {
    var lowestNumIndex = i;
    for(var j = i+1; j < array.length; j++) {
      if(array[lowestNumIndex] > array[j]) {
        lowestNumIndex = j;
      }
    }

    if(lowestNumIndex !== i) {
      var temp = array[i]
      array[i] = array[lowestNumIndex]
      array[lowestNumIndex] = temp;
    }
  }
  return array;
}

array = [3,2,7,6,4]
console.log(selectionSort(array))

array = []
console.log(selectionSort(array))
