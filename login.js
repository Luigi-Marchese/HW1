
function onResponse(response){
    return response.json();
}
    
function onJson(json){
    const address=document.querySelector("address");
    console.log(json.device.type);
    address.textContent=address.textContent +" "+ json.device.type+" version";
}
    
fetch("verifica_dispositivo.php").then(onResponse).then(onJson);