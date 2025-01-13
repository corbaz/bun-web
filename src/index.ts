// src/index.ts
console.log("¡Hola desde TypeScript!");

// Declare the type for window
declare global {
  interface Window {
    info: () => void;
  }
}
function usuarios() {
  alert("¡Botón pulsado...!");
  console.log("¡Botón pulsado!");
}
// Define the function and attach it to window
window.info = usuarios;

const title = document.querySelector("h1");
if (title) {
  title.textContent = "¡Hola desde TypeScript!";
}



