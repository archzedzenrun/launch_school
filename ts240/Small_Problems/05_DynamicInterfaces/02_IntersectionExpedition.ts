interface Dog {
  bark(): void,
}

interface Cat {
  meow(): void,
}

type Pet = Dog & Cat;

const pet: Pet = {
  bark: () => console.log('bark'),
  meow: () => console.log('meow'),
}

pet.bark()
pet.meow()