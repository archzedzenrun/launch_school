function makeCountry(name, continent, visited = false) {
  return {
    name,
    continent,
    visited,
    visitCountry() {
      this.visited = true;
    },
    getDescription() {
      console.log(`${this.name} is located in ${this.continent}. I ${this.visited ? 'have' : "haven't"} visited ${this.name}`);
    },
  };
}

let chile = makeCountry('The Republic of Chile', 'South America');
let canada = makeCountry('Canada', 'North America');
let southAfrica = makeCountry('The Republic of South Africa', 'Africa');

canada.getDescription();       // "The Republic of Chile is located in South America."
canada.visitCountry();
canada.getDescription();