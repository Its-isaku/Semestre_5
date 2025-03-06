//? Variables
let userName = document.getElementById("name");
let userAge = document.getElementById("age");
let userGender = document.getElementById("gender");
let userGrade1 = document.getElementById("grade1");
let userGrade2 = document.getElementById("grade2");
let termsAndConditions = document.getElementById("terms");
let registerButton = document.getElementById("registerBtn");
let userArray = [];

//? Constructor de usuario
function User(userName, userAge, userGender, userGrade1, userGrade2) {
    this.name = userName;
    this.age = userAge;
    this.gender = userGender;
    this.grade1 = userGrade1;
    this.grade2 = userGrade2;
}

//? Registrar usuario
function register() {
    let newStudent = new User(
        userName.value,
        userAge.value,
        userGender.value,
        userGrade1.value,   
        userGrade2.value
    );
    userArray.push(newStudent);
    save(newStudent); //? Guardar en localStorage
    display(); 
}

//? Mostrar datos en la tabla
function display() {
    let data = read(); //? Leer desde localStorage
    console.log(data);

    let table = document.getElementById("table-students");
    if (!table) return; //? Evita errores si no estamos en tables.html

    data.forEach(student => {
        let mean = (parseFloat(student.grade1) + parseFloat(student.grade2)) / 2;
        table.innerHTML += `
            <tr>
                <td>${student.name}</td>
                <td>${student.age}</td>
                <td>${student.gender}</td>
                <td>${student.grade1}</td>
                <td>${student.grade2}</td>
                <td>${mean.toFixed(2)}</td>
                <td><button class="btn-danger" onclick="deleteStudent('${student.name}')">Eliminar</button></td>
            </tr>
        `;
    });
}

//? deleteStudent function
function deleteStudent(name) {
    let data = read();
    data = data.filter(student => student.name !== name);
    localStorage.setItem("students", JSON.stringify(data));
    location.reload();
}

//? Evento de click en el botón de registro
if (registerButton) {
    registerButton.addEventListener("click", function (event) {
        event.preventDefault(); //? Evita la recarga
        
        if (
            userName.value.trim() === "" ||
            userAge.value.trim() === "" ||
            userGender.value.trim() === "" ||
            userGrade1.value.trim() === "" ||
            userGrade2.value.trim() === ""
        ) {
            alert("Por favor, llene todos los campos.");
        } else if (!termsAndConditions.checked) {
            alert("Por favor, acepte los términos y condiciones.");
        } else {
            register();
            alert("Registro exitoso.");
        }
    });
}

//? Cargar datos en tables.html al abrir la página
document.addEventListener("DOMContentLoaded", function () {
    display();
});
