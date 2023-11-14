function splitSort(string) {
  return string.split('').sort();
}

function equalArrays(arr1, arr2) {
  for (let i = 0; i < arr1.length; i += 1) {
    if (arr1[i] !== arr2[i]) {
      return false;
    }
  }

  return true;
}

function isAnagram(source, target) {
  source = splitSort(source);
  target = splitSort(target);

  return equalArrays(source, target);
}

function anagram(word, list) {
  return list.filter(list_word => isAnagram(list_word, word));
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]