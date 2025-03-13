//? Función para obtener los usuarios de la base de datos
function getUsers() {
    fetch('../BE/get_users.php')
        .then(response => {
            if (!response.ok) {
                throw new Error('Error en la respuesta del servidor');
            }
            return response.json();
        })
        .then(data => {
            //? Si la solicitud es exitosa, mostrar los usuarios
            if (data.users) {
                displayUsers(data.users);
            } else {
                console.log(data.message || 'No se encontraron usuarios');
            }
        })
        .catch(error => {
            console.error('Error al obtener usuarios:', error);
            alert('Hubo un error al obtener los usuarios');
        });
}

//? function to get quotes from the API
function getQuotes() {
    fetch('https://api.api-ninjas.com/v1/quotes', {
        headers: {
            'X-Api-Key': 'AyGoy7NK1knyTybTePrTaw==wbL5fsYz7iF1rzmV'
        }
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Error in API response: ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            console.log('Quote data:', data);
        
            //? Call a function to display the quote on the page
            if (data && data.length > 0) {
                displayQuote(data[0]);
            }
        })
        .catch(error => {
            console.error('Error fetching quotes:', error);
        });
}


//? Function to display a quote on the page
function displayQuote(quote) {
    //? Create or find a container for the quote
    let quoteContainer = document.getElementById('quoteContainer');    
    //? Set the quote content
    quoteContainer.innerHTML = `
        <blockquote>
            <p style="font-style: italic;">"${quote.quote}"</p>
            <footer>— <cite>${quote.author}</cite></footer>
        </blockquote>
    `;
}

//? Función para mostrar los usuarios en la tabla
function displayUsers(users) {
    let tableUser = document.getElementById('tableUser');
    if (!tableUser) return;

    //? Mantener la fila de encabezado
    let headerRow = tableUser.rows[0];
    tableUser.innerHTML = '';
    tableUser.appendChild(headerRow);

    //? Si no hay usuarios, mostrar mensaje
    if (users.length === 0) {
        const noDataRow = document.createElement('tr');
        const noDataCell = document.createElement('td');
        noDataCell.colSpan = 3;
        noDataCell.textContent = 'No hay usuarios registrados';
        noDataCell.style.textAlign = 'center';
        noDataRow.appendChild(noDataCell);
        tableUser.appendChild(noDataRow);
        return;
    }

    //? Agregar cada usuario a la tabla
    users.forEach(user => {
        tableUser.innerHTML += `
            <tr>
                <td>${user.name}</td>
                <td>${user.age}</td>
                <td>${user.email}</td>
            </tr>
        `;
    });
}


document.addEventListener('DOMContentLoaded', function() {
    //? Cargar usuarios al cargar la página
    getUsers();
    
    //? Cargar citas al cargar la página
    getQuotes();
    
    //? Configurar el botón de regresar
    const backButton = document.querySelector('.btn');
    if (backButton) {
        backButton.addEventListener('click', function() {
            window.location.href = 'register.html';
        });
    }
});