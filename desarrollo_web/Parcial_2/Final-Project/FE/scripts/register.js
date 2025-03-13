const form = document.getElementById('registrationForm');

// Listener para el formulario
form.addEventListener('submit', function(event) {
    event.preventDefault(); //? prevent the default behavior of the form

    //? get the values of input fields
    const name = document.getElementById('name').value;
    const age = parseInt(document.getElementById('age').value); 
    const email = document.getElementById('email').value;

    //? create a object from the form
    const data = {
        name: name,
        age: age,
        email: email
    };
    console.log(data);

    //? send to php using fetch
    fetch('../BE/insert.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data) //? convert the object to json
    })
    //? get the response from the server
    .then(response => {
        if(!response.ok){
            throw new Error('error on the server response');
        }
        return response.json();
    })
    //? shows the result on the console
    .then(result => {
        console.log('servr response:', result);
        alert(result.message || 'successful');
    })
    //? catch the error
    .catch(error => {
        console.error('error on the server:', error);
        alert('There was an error on the response');
    });
    //?clear the form
    form.reset();
});

//? Configurar el botón "Usuarios" para redireccionar a index.html
document.addEventListener('DOMContentLoaded', function() {
    const usersButton = document.querySelector('.btn-users');
    
    if (usersButton) {
        usersButton.addEventListener('click', function() {
            window.location.href = 'table.html';
        });
    }
});