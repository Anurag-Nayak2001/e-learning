function nullCheck(params) {
    if(params.trim()==='') {
        return true
    }
    else
        return false
}



document.querySelector("#submit-btn").addEventListener("click", (e) => {
    let valid = 1;
    var name = document.getElementById("name").value;
    if(nullCheck(name) && valid == 1) {
        window.alert("Name cannot be empty");
        valid = 0;
    }

    const Name = document.getElementById("name").value;
    if(nullCheck(Name) && valid == 1) {
        window.alert("Name cannot be empty");
        valid = 0;
    } else {
        if(Name.length > 25 && valid == 1) {
            alert("Name cannot exceed 25 characters");
            valid = 0;
        } else {
            if(!Name.match(/^[A-Za-z]+$/) && valid == 1) {
                alert("Name should only contain characters");
                valid = 0;
            }
        }
    }

    const email = document.getElementById("email").value;
    if(nullCheck(email) && valid == 1) {
        alert("Email cannot be empty");
        valid = 0;
    }

    const age = document.getElementById("age").value;
    if(nullCheck(age) && valid == 1) {
        alert("Age cannot be empty");
        valid = 0;
    } else {
        if(parseInt(age) <= 18 || parseInt(age) >= 23 && valid == 1) {
            alert("Age should be in the range of 18-23");
            valid = 0;
        }
    }

    const branch = document.getElementById("branch").value;
    if(branch === "none" && valid == 1) {
        alert("Select a Branch!");
        valid = 0;
    }

    if(!(document.getElementById("male").checked || document.getElementById("female").checked || document.getElementById("other").checked) && valid == 1) {
        alert("Select your Gender!!");
        valid = 0;
    }

    const address = document.getElementById("address").value;
    if(nullCheck(address) && valid == 1) {
        alert("College Address cannot be empty");
        valid = 0;
    }

    let tech = ["C","Python","Java"];
    let count = 0;
    tech.forEach(element => {
        if(document.getElementById(element).checked) {
            count++;
        }
    });
    
    if(count < 2 && valid == 1) {
        alert("Atleast two checkboxes should be checked")
        valid = 0;
    }

    e.preventDefault();
    if(valid == 1){
        var newPage = window.open('');
        newPage.document.write(`Name : ${name}`)
    }                              
})