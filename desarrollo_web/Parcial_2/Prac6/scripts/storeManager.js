function save(student){
    let list = read();
    list.push(student);
    let val = JSON.stringify(list);
    localStorage.setItem("students",val)
}

function read(){
    let data = localStorage.getItem("students");
    if(!data) //? NOT data
        return []; //? create the array
    else
        return JSON.parse(data); //? convert the JSON string to an object
}