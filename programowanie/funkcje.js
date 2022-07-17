
const znajdzMaksimum = (losoweLiczby) => {
  // poszukiwanie maksymalnej wartoswci
  let maksymalnaWartosc = losoweLiczby[0];
  for (let k = 0; k < losoweLiczby.length; k++) {
      if (maksymalnaWartosc < losoweLiczby[k]) {
        maksymalnaWartosc = losoweLiczby[k];
      }
  }
  return maksymalnaWartosc;
}

let max = znajdzMaksimum([1,2,3]);
console.log(max);
console.log(znajdzMaksimum([5,2, -1, 6, 0]))


function wygenerujLosoweLiczby(dlugosc) {
  const losoweLiczby = [];
  while (dlugosc-- > 0) {
    losoweLiczby.push(Math.floor(100*Math.random()));
  }
  return losoweLiczby;
}

console.log(wygenerujLosoweLiczby(1));
console.log(wygenerujLosoweLiczby(2));
console.log(wygenerujLosoweLiczby(10));

console.log(znajdzMaksimum(wygenerujLosoweLiczby(100000000)));
