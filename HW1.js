function onResponse(response){
    return response.json();
}
let mapOptions={
    center:[37.504, 15.0831],
    zoom: 10
}
let map= new L.map('map', mapOptions);
let layer = new L.TileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png');
map.addLayer(layer);
let marker = new L.Marker([37.504, 15.0831]);
marker.addTo(map);

function onJson2(json){
    const sec_sugg=document.getElementById("contenitore_suggerimenti");
    const div_parent=document.getElementById("AcquistiSuggeriti");
    const h1=document.createElement('h1');
    h1.textContent="I nostri consigli: ";
    sec_sugg.appendChild(h1);
    sec_sugg.appendChild(div_parent);
    for(const sugg of json){
        const div=document.createElement('div');
        div.classList.add("Suggerimento");
        const h1=document.createElement('h1');
        h1.textContent=sugg.titolo;
        const img = document.createElement('img');
        img.src=sugg.url;
        const p = document.createElement('p');
        p.textContent=sugg.descrizione;
        div.appendChild(h1);
        div.appendChild(img);
        div.appendChild(p);
        div_parent.appendChild(div);
    }
}

function onJson(json){
    const sec_logo=document.getElementById("contenitore_logo");
    const div=document.getElementById("elencoBrand");
    const h1=document.createElement('h1');
    h1.textContent="I nostri brand: ";
    sec_logo.appendChild(h1);
    for(const logo of json){
        const a=document.createElement('a');
        a.href='login.php';
        const img=document.createElement('img');
        img.src= logo.url;
        a.appendChild(img);
        div.appendChild(a);
        sec_logo.appendChild(div);
    }
    fetch("riempimento_consigli.php").then(onResponse).then(onJson2)
}

function onJson3(json){
    const address=document.querySelector("address");
    address.textContent=address.textContent +" "+ json.device.type+" version";
}



fetch("verifica_dispositivo.php").then(onResponse).then(onJson3);

fetch("riempimento_brand.php").then(onResponse).then(onJson);