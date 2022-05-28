function acquisto(event){
    const b=event.currentTarget;
    const div = b.parentElement;
    const id=div.querySelector('p.idMoto');
    window.location.href="carrello.php?id="+id.textContent;
}



function onJson(json){
    const sec_ben=document.getElementById("benelli");
    const sec_kawa=document.getElementById("kawasaki");
    const sec_bmw=document.getElementById("bmw");
    sec_ben.innerHTML="";
    sec_kawa.innerHTML="";
    sec_bmw.innerHTML="";
    for(const moto of json){
        const div =document.createElement("div");
        const image=document.createElement('img');
        const nome_moto=document.createElement('p');
        const prezzo_moto=document.createElement('p');
        const marca_moto=document.createElement('p');
        const id_moto=document.createElement('p');
        id_moto.classList.add('idMoto');
        id_moto.classList.add('nonMostrare');
        const acquista_button=document.createElement('button');
        acquista_button.textContent="ACQUISTA";
        acquista_button.addEventListener('click', acquisto);
        image.src=moto.url;
        nome_moto.textContent="Modello: "+moto.modello;
        prezzo_moto.textContent="Prezzo: "+'€'+moto.prezzo;
        marca_moto.textContent="Marca: "+moto.marca;
        id_moto.textContent=moto.id;
        div.appendChild(image);
        div.appendChild(marca_moto);
        div.appendChild(nome_moto);
        div.appendChild(prezzo_moto);
        div.appendChild(acquista_button);
        div.appendChild(id_moto);
        if(moto.marca==="benelli"){
            sec_ben.appendChild(div);
        }else if(moto.marca==="kawasaki"){
            sec_kawa.appendChild(div);
        }else if(moto.marca=="bmw"){
            sec_bmw.appendChild(div);
        }
    }
}
function onResponse(response){
    return response.json();
}
function onError(error){
    console.log("errore");
}


function ricerca(event){
    event.preventDefault();
    const parametro = document.forms["form_cerca"]["barra_ricerca"].value;
    if(parametro!==""){
        fetch("ricerca_catalogo.php?parametro="+parametro).then(onResponse, onError).then(onJson);
    }
    
}

function mostra(){
    fetch("riempimento_catalogo.php").then(onResponse).then(onJson);    
}

function onJson2(json){
    const address=document.querySelector("address");
    address.textContent=address.textContent +" "+ json.device.type+" version";
}

fetch("verifica_dispositivo.php").then(onResponse).then(onJson2);


fetch("riempimento_catalogo.php").then(onResponse).then(onJson);
const form= document.querySelector("form");
form.addEventListener('submit', ricerca);
const mostra_button=document.getElementById("mostra");
mostra_button.addEventListener("click", mostra);
