function onText2(text){
    if(text==="ace"){
        const new_p=document.createElement("p");
        new_p.textContent="Account esistente.";
        div.appendChild(new_p);
        div.classList.remove("nascosto");
        div.classList.add("error");
        new_p.classList.add("avvertimento");
    }
    if(text==="cnv"){
        const new_p=document.createElement("p");
        new_p.textContent="Campi non validi.";
        div.appendChild(new_p);
        div.classList.remove("nascosto");
        div.classList.add("error");
        new_p.classList.add("avvertimento");
    }
}

function onText1(text){
    if(text==="nonDisponibile"){
        div.innerHTML="";
        const new_p=document.createElement("p");
        new_p.textContent="Nome utente/email/cellulare già in uso";
        div.appendChild(new_p);
        div.classList.remove("nascosto");
        div.classList.add("error");
        new_p.classList.add("avvertimento");
    }else if(text==="ok"){
        const form_data = {method: 'post', body: new FormData(form)};
        fetch("http://localhost/programmazione_web/registrazione.php", form_data).then(onResponse).then(onText2);
    }
}
function onResponse(response){
    return response.text();
}

function controllo(event){
        event.preventDefault();
        $flag_error=false;
        const nome = document.forms["form_reg"]["nomeUtente"].value;
        const email = document.forms["form_reg"]["email"].value;
        const cellulare = document.forms["form_reg"]["cellulare"].value;
        const password = document.forms["form_reg"]["password"].value;
        const c_password = document.forms["form_reg"]["c_password"].value;
        div.innerHTML="";
        if (nome == "" || email == "" || cellulare == "" || password == ""|| c_password == "") {
            const new_p=document.createElement("p");
            new_p.textContent="Devi riempire tutti i campi";
            div.appendChild(new_p);
            div.classList.remove("nascosto");
            div.classList.add("error");
            new_p.classList.add("avvertimento");
            $flag_error=true;
        }
        if(password.length<8){
            const new_p=document.createElement("p");
            new_p.textContent="Password troppo corta";
            div.appendChild(new_p);
            div.classList.remove("nascosto");
            div.classList.add("error");
            new_p.classList.add("avvertimento");
            $flag_error=true;
        }
        if(password!==c_password){
            const new_p=document.createElement("p");
            new_p.textContent="Le password non corrispondono";
            div.appendChild(new_p);
            div.classList.remove("nascosto");
            div.classList.add("error");
            new_p.classList.add("avvertimento");
            $flag_error=true;
        }
        if(cellulare.length!=10){
            const new_p=document.createElement("p");
            new_p.textContent="Numero cellulare inesistente";
            div.appendChild(new_p);
            div.classList.remove("nascosto");
            div.classList.add("error");
            new_p.classList.add("avvertimento");
            $flag_error=true;
        }
        if($flag_error===false){
            const form_data = {method: 'post', body: new FormData(form)};
            fetch("http://localhost/programmazione_web/controllo_utente.php", form_data).then(onResponse).then(onText1);    
        }
    }


    
function onJson2(json){
    const address=document.querySelector("address");
    address.textContent=address.textContent +" "+ json.device.type+" version";
}

function onResponse2(response){
    return response.json();
}
    
fetch("verifica_dispositivo.php").then(onResponse2).then(onJson2);
    
const form= document.querySelector("form");
form.addEventListener('submit', controllo);
const div = document.querySelector("#alert");