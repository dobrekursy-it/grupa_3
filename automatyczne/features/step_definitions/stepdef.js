const assert = require('assert');
const { Given, When, Then, setDefaultTimeout } = require('@cucumber/cucumber');
const {Builder, By} = require('selenium-webdriver');
setDefaultTimeout(600 * 1000);

// Given("", () => {
//   driver.get('https://jagusiak.github.io/xo/');
// })
//
// When("", () => {
//
// })
// Then(() => {
//   assert.strictEqual(true, czyWidac);
// })
