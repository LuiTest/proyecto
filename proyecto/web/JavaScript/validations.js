function login(){

    if((document.getElementById("uname").value=="") || (document.getElementById("password").value=="")){
        alert("No se pueden dejar campos en blanco");
        return false;
    }else{
        return true;
    }

} // fin validar