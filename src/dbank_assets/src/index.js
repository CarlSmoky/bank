import {dbank} from "../../declarations/dbank";

window.addEventListener("load", async () => {
  // console.log("Finished loading");
  const currentAmount = await dbank.checkBalace();
  
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
});

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();
  // console.log("Submitted");

  const button = e.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  await dbank.topUp(inputAmount);

  const currentAmount = await dbank.checkBalace();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;

  document.getElementById("input-amount").value = "";

  button.removeAttribute("disabled");


})