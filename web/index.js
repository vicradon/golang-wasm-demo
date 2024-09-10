(async () => {
  const goWasm = new window.Go();
  const result = await WebAssembly.instantiateStreaming(
    fetch("./browser.wasm"),
    goWasm.importObject
  );
  goWasm.run(result.instance);
})();

const $ = (selector) => document.querySelector(selector);

function callFunction() {
  if (
    !$("#num1").value ||
    !$("#num2").value ||
    isNaN($("#num1").value) ||
    isNaN($("#num2").value)
  ) {
    return;
  }
  const num1 = +$("#num1").value;
  const num2 = +$("#num2").value;

  $("#result").innerHTML += `${num1} + ${num2} = ${window.wasmSum(
    num1,
    num2
  )}<br />`;
}

$("#myButton").addEventListener("click", callFunction);
