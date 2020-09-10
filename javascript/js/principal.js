var titulo = document.querySelector(".titulo");
titulo.textContent = "Aparecida Nutricionista";

var paciente = document.querySelector("#primeiro-paciente");
var tdPeso = paciente.querySelector(".info-peso");
var peso = tdPeso.textContent;


var tdAltura = paciente.querySelector(".info-altura");
var altura = tdAltura.textContent;

console.log(paciente);
console.log(tdPeso, tdAltura);

var imc = peso / (altura * altura);
console.log("IMC:",imc);


var tdImc = paciente.querySelector(".info-imc");
tdImc.textContent = imc;