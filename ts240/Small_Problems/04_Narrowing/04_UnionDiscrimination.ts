type Circle = {
  kind: "circle",
  radius: number,
}

type Square = {
  kind: "square",
  sideLength: number,
}

type Shape = Circle | Square;

function getArea(obj: Shape): void {
  if ('radius' in obj) {
    console.log(Math.PI * obj.radius ** 2);
  } else {
    console.log(obj.sideLength ** 2);
  }
}

getArea({ kind: "circle", radius: 10 })
getArea({ kind: "square", sideLength: 10 })