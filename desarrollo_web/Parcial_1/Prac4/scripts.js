const formTxt = document.getElementById('txt');
const formEmail = document.getElementById('email');
const formPhone = document.getElementById('phone');
const formErrorValid = document.getElementById('error-valid');
const formBtn = document.getElementById('btn');

function PhoneValid(phone) {
    const phoneRegex = /^(\+?\d{1,3}[-.\s]?)?(\(?\d{3}\)?[-.\s]?)?\d{3}[-.\s]?\d{4}$/;
    return phoneRegex.test(phone) && phone.length <= 15;
}

function EmailValid(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

function TextValid(text) {
    return text.trim() !== "";
}

function validation(txt, email, phone) {
    formErrorValid.textContent = ""; 
    formErrorValid.classList.remove('show', 'success', 'error');

    if ((!TextValid(txt) && !EmailValid(email) && !PhoneValid(phone) || !TextValid(txt) && !EmailValid(email) || !TextValid(txt) && !PhoneValid(phone) || !EmailValid(email) && !PhoneValid(phone))) {
        formErrorValid.textContent = "Error: All fields are required!";
        formErrorValid.classList.add('show', 'error');
        return false;
    }

    if (!TextValid(txt)) {
        formErrorValid.textContent = "Error: Text is empty!";
        formErrorValid.classList.add('show', 'error');
        return false;
    }

    if (!EmailValid(email)) {
        formErrorValid.textContent = "Error: Email is invalid!";
        formErrorValid.classList.add('show', 'error');
        return false;
    }

    if (!PhoneValid(phone)) {
        formErrorValid.textContent = "Error: Phone is invalid!";
        formErrorValid.classList.add('show', 'error');
        return false;
    }

    return true;
}

function register() {
    let txtText = formTxt.value;
    let emailText = formEmail.value;
    let phoneText = formPhone.value;

    if (validation(txtText, emailText, phoneText)) {
        let li = document.createElement("li");
        li.className = "list-item";
        li.innerHTML = `
            <span class="text-item">${txtText}</span>
            <span class="text-item">${emailText}</span>
            <span class="text-item">${phoneText}</span>
        `;
        formErrorValid.appendChild(li);
        formErrorValid.textContent = "Success: Registration completed!";
        formErrorValid.classList.add('show', 'success');
    }
}

formBtn.addEventListener('click', register);