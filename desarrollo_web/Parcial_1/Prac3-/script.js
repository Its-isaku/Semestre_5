console.log("scipt");

const taskInput = document.getElementById("txtTask");
const addTaskBtn = document.getElementById("addTaskBtn");
const taskList = document.getElementById("taskList");
const taskError = document.getElementById("taskError");


function validation(task){
    let isValid = true;

    if(task===""){
        isValid = false;
        taskError.textContent = "";

        //? adding the error message in <small>
        taskError.textContent = "Error: Task is empty!";
    }

    return isValid;
}

function register(){
    let taskText = taskInput.value; //? getting the value of the input

    if(validation(taskText)){
        //? Create the html element
        let li = document.createElement("li");
        li.className = "list-item";
        //? adding the text to the element
        li.innerHTML = `
        <span class="text-item">${taskText}</span>
        <Button class = "dondeBtn"> Done </Button>
        `;

        // selecting by class
        li.querySelector(".doneBtn").addEventListener(".doneBtn").addEventListener("click",()=>(
            li.querySelector(".text-item").classList.toggle("completed")
        ));

        taskList.appendChild(li); //? adding the element to the list
    }
}       

function init(){
    document.addEventListener("click", register);   
    
}
window.onload = init; //? when the window is loaded, the init function is called