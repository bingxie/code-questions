//Interview technical coding questions
//inputNames = ["a,"b","c","d,"e","f"];
function formGroups(inputNames) {
  var numOfPeople = inputNames.length;
  var numOfGroups = numOfPeople/3;

  var outGroups = [];
  var group = [];

  var peopleInGroup = 3;

  var j = 0;
  if (numOfPeople <= 2) {
      return inputNames;
  }

  for(var i=0; i<numOfPeople; i++) {
    if (j < peopleInGroup) {
      group.push(inputNames[i]);
    }
    j++;
    if (j == peopleInGroup) {
      outGroups.push(group);
      group = [];
      j = 0;
    }
  }
  console.log(outGroups)

  if (outGroups[outGroups.length-1].length < 3) {
      outGroups[outGroups.length-2].push(outGroups[outGroups.length-1]);
      delete outGroups[outGroups.length-1];
  }

  return outGroups;
}

// inputNames = ["a","b","c","d","e","f"];
// console.log(formGroups(inputNames))

inputNames = ["a","b","c","d","e"];
console.log(formGroups(inputNames))

// inputNames = ["a","b","c","d","e","f","g"];
// console.log(formGroups(inputNames))
