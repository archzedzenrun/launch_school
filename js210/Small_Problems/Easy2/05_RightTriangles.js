function triangle(num) {
  for (let i = 1; i <= num; i += 1) {
    let spaces = '';
    for (let spaceCount = 0; spaceCount < num - i; spaceCount += 1) {
      spaces += ' ';
    }

    let stars = '';
    for (let starCount = 1; starCount <= i; starCount += 1) {
      stars += '*';
    }

    console.log(spaces + stars);
  }
}

triangle(9);