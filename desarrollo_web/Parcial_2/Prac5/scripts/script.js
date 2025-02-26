document.addEventListener("DOMContentLoaded", ()=> {
    const itemInput = document.getElementById("txtItem");
    const AddItemBtn = document.getElementById("btnAdd");
    const shoppingList = document.getElementById("shoppinglist");

    let items = [
        {name: "laptop", purchased: false},
        {name: "speaker", purchased: false},
        {name: "keyboard", purchased: false},
    ]; //? Array to store the items

    function renderList(){
        //? Clear the list display
        shoppingList.innerHTML = "";

        //? Update the list display
        items.forEach((item, index) => {
            const li = document.createElement("li");
            li.className = "list-group-item";
            li.innerHTML = `
                <span>${item.name}</span>
                <div>
                <button class="btnDelete" onclick="deleteItem(${index})">❌</button>
                <button class="btnEdit" onclick="edditItem(${index})">✏️</button>
                </div>
                `;

            shoppingList.appendChild(li);           
        });
        
    }

    //? funtion for deleting items
    window.deleteItem = (deleteIndex) => {
        items.splice(deleteIndex, 1); //? Remove the item from the array
        renderList(); //? Update the list display
    }

    window.edditItem = (edditIndex) => {
        let newName = prompt("Enter new name for the item");
        if(newName == ""){
            alert("item cannot be empty");
            return;
        }
        items[edditIndex].name = newName;
        renderList();
    }   

    AddItemBtn.addEventListener("click", ()=> {
        let itemText = itemInput.value;
        //? for regstering item
        if(itemText == ""){
            alert("item cannot be empty");
            return;
        }
        
        items.push({name: itemText, purchased: false}); //? Create a new item object and add it to the array
        renderList();
    });

    document.getElementById('animateButton').addEventListener('click', function() {
    const box = document.querySelector('.animated-box');
    box.style.transform = 'translateX(200px)';
    setTimeout(() => {
        box.style.transform = 'translateX(0)';
    }, 2000);
});

    renderList(); //? initial render   
});