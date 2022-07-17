const assert = require('assert');
const { Given, When, Then, setDefaultTimeout } = require('@cucumber/cucumber');
const {Builder, By} = require('selenium-webdriver');
setDefaultTimeout(600 * 1000);

let driver = new Builder().forBrowser('chrome').build();

const doZnaku = (tekst) => {
  if (tekst == 'kolkiem') {
    return 'o';
  }
  return 'x';
}

const kolumny = ["lewy", "srodkowy", "prawy"];
const rzedy = ["gorny", "srodkowy", "dolny"];
const pobierzKafelek = (kolumna, rzad) => {
  const indeks = kolumny.indexOf(kolumna) + 3 * rzedy.indexOf(rzad);
  return driver.findElement(By.id('s' + indeks));
}

Given('gracz uruchomil gre', function () {
  driver.get('https://jagusiak.github.io/xo/');
});

When('gracz kilka w {string} {string} kafelek', function (kolumna, rzad) {
  pobierzKafelek(kolumna, rzad).click();
});

Then('kafalek {string} {string} jest {string}',  async (kolumna, rzad, oczekiwanyZnak) => {
  const element = await pobierzKafelek(kolumna, rzad);
  const znak = await element.getAttribute('data-sign');
  assert.strictEqual(doZnaku(oczekiwanyZnak), znak);
});
