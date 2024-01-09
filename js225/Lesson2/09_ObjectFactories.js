function makeCar(rate, brakingRate) {
  return {
    speed: 0,
    rate,
    brakingRate,
    accelerate() {
      this.speed += this.rate;
    },
    brake() {
      this.speed -= this.brakingRate;
      if (this.speed < 0) this.speed = 0;
    }
  };
}

let sedan = makeCar(8, 6);
sedan.accelerate();
console.log(sedan.speed); //8
sedan.brake();
console.log(sedan.speed); //2
sedan.brake();
console.log(sedan.speed); //0