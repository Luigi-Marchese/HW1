function onResponse(response){
    return response.json();
}

function elimina(event){
    const b=event.currentTarget;
    const div = b.parentElement;
    const id=div.querySelector('p.idMoto');
    fetch("elimina_elemento.php?id="+id.textContent);
    fetch("riempimento_carrello.php").then(onResponse).then(onJson);
}

function onJson(json){
    const sec = document.getElementById("contenitore");
    sec.innerHTML="";
    for(moto of json){
        const div =document.createElement("div");
        const image=document.createElement('img');
        const nome_moto=document.createElement('p');
        const prezzo_moto=document.createElement('p');
        const marca_moto=document.createElement('p');
        const id_moto=document.createElement('p');
        const quantita_moto=document.createElement('p');
        const nome_utente=document.createElement('p');
        id_moto.classList.add('idMoto');
        id_moto.classList.add('nonMostrare');
        const elimina_button=document.createElement('button');
        elimina_button.addEventListener('click', elimina);
        elimina_button.textContent="RIMUOVI";
        image.src=moto.url;
        nome_moto.textContent="Modello: "+moto.modello;
        prezzo_moto.textContent="Prezzo: "+'€'+moto.prezzo;
        marca_moto.textContent="Marca: "+moto.marca;
        id_moto.textContent=moto.id;
        quantita_moto.textContent="Quantità: "+moto.quantita;
        div.appendChild(image);
        div.appendChild(marca_moto);
        div.appendChild(nome_moto);
        div.appendChild(prezzo_moto);
        div.appendChild(quantita_moto);
        div.appendChild(elimina_button);
        div.appendChild(id_moto);
        sec.appendChild(div);
    }
}


function onJson2(json){
    const address=document.querySelector("address");
    address.textContent=address.textContent +" "+ json.device.type+" version";
}



fetch("verifica_dispositivo.php").then(onResponse).then(onJson2);

fetch("riempimento_carrello.php").then(onResponse).then(onJson);


