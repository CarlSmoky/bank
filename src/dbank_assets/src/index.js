import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
  // console.log("Finished loading");
  update();
});

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();
  // console.log("Submitted");

  const button = e.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  if (document.querySelector("#input-amount").value.length != 0) {
    await dbank.topUp(inputAmount);
  }

  if (document.querySelector("#withdrawal-amount").value.length != 0) {
    await dbank.withdraw(outputAmount)
  }

  await dbank.compound();

  update();

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";

  button.removeAttribute("disabled");

});

const update = async () => {
  const currentAmount = await dbank.checkBalace();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
};