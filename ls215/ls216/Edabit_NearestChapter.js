// https://edabit.com/challenge/E5kxeJA782rNX2bch

function nearestChapter(book, page) {
  if (page === undefined) {
    return Object.entries(book)[Object.entries(book).length - 1][0];
  }

  book = Object.entries(book).map(entry => {
    let chapter = entry[0];
    let pageNum = entry[1];
    let difference = Math.abs(pageNum - page);
    return [chapter, pageNum, difference];
  })

  let smallestDistance = Math.min(...book.map(chapter => chapter[2]));
  let booksWithSmallest = book.filter(entry => entry[2] === smallestDistance);

  return booksWithSmallest.sort((book1, book2) => book2[1] - book1[1])[0][0];
}

// console.log(nearestChapter({
//   "Chapter 1" : 1,
//   "Chapter 2" : 15,
//   "Chapter 3" : 37
// })); // 'Chapter 3'


// console.log(nearestChapter({
//   "Chapter 1" : 1,
//   "Chapter 2" : 15,
//   "Chapter 3" : 37
// }, 10)) //➞ "Chapter 2"


// console.log(nearestChapter({
//   "New Beginnings" : 1,
//   "Strange Developments" : 62,
//   "The End?" : 194,
//   "The True Ending" : 460
// }, 200)) //➞ "The End?"


// console.log(nearestChapter({
//   "Chapter 1a" : 1,
//   "Chapter 1b" : 5
// }, 3)) //➞ "Chapter 1b"