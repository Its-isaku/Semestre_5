const formTxt = document.getElementById('txt');
const formEmail = document.getElementById('email');
const formPhone = document.getElementById('phone');
const formErrorValid = document.getElementById('error-valid');
const formBtn = document.getElementById('btn');

function validation(txt, email, phone){
    let isValid = true;

    if(txt === "" || email === "" || phone === ""){
        isValid = false;
        formErrorValid.textContent = "Error: Fields are empty!";
    }
    else{
        formErrorValid.textContent = "";
    }
    return isValid;
}

function register(){
    let txtText = formTxt.value;
    let emailText = formEmail.value;
    let phoneText = formPhone.value;

    if(validation(txtText, emailText, phoneText)){
        let li = document.createElement("li");
        li.className = "list-item";
        li.innerHTML = `
        <span class="text-item">${txtText}</span>
        <span class="text-item">${emailText}</span>
        <span class="text-item">${phoneText}</span>
        `;
        formErrorValid.appendChild(li);
        formErrorValid.textContent = "Success: Registration completed!";
    }
}

formBtn.addEventListener('click', register);