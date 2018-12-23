firebase.initializeApp({
	apiKey: "AIzaSyC8FYrE8izBDa4UKwHt6-bCCokOlN0sLuk",
    authDomain: "prueba-33361.firebaseapp.com",
    projectId: "prueba-33361"
});

var db = firebase.firestore();


//grabar documento
function guardar(){
	var nombre = document.getElementById("nombre").value;
	var apellido = document.getElementById("apellido").value;
	var fecha = document.getElementById("fecha").value;
	
	db.collection("usuario").add({
		first: nombre,
		last: apellido,
		born: fecha
	})
	.then(function(docRef) {
		console.log("Document written with ID: ", docRef.id);
		document.getElementById("nombre").value="";
		document.getElementById("apellido").value="";
		document.getElementById("fecha").value="";
	})
	.catch(function(error) {
		console.error("Error adding document: ", error);
	});
}


// leer documento
var tabla=document.getElementById("tabla");
db.collection("usuario").onSnapshot((querySnapshot) => {
	tabla.innerHTML="";
    querySnapshot.forEach((doc) => {
		tabla.innerHTML+=`
		<tr>
		<th scope="row">${doc.id}</th>
      <td>${doc.data().first}</td>
      <td>${doc.data().last}</td>
      <td>${doc.data().born}</td>
	  <td><button class="btn btn-danger" onclick="eliminar('${doc.id}')"> Eliminar </button> </td>
	  <td><button class="btn btn-warning" Editar onclick="modificar('${doc.id}','${doc.data().first}','${doc.data().last}','${doc.data().born}')">Editar </button> </td>
	 
	  </tr>
	`;
  
    });
});




// elimina
function eliminar(id){
	db.collection("usuario").doc(id).delete().then(function() {
		console.log("Document successfully deleted!");
	}).catch(function(error) {
		console.error("Error removing document: ", error);
	});
}



//modificar
function modificar(id,nombre,apellido,fecha){
	

    document.getElementById("nombre").value=nombre;
	document.getElementById("apellido").value=apellido;
	document.getElementById("fecha").value=fecha;
	
	var boton = document.getElementById("boton");
	boton.innerHTML="Editar";
	boton.onclick=function(){
			var washingtonRef = db.collection("usuario").doc(id);
		console.log("hamas ingresa");
		var nombre = document.getElementById("nombre").value;
		var apellido = document.getElementById("apellido").value;
		var fecha = document.getElementById("fecha").value;
	
		return washingtonRef.update({
			first: nombre,
			last: apellido,
			born: fecha
		})
		.then(function() {
			console.log("Document successfully updated!");
		    document.getElementById("nombre").value="";
			document.getElementById("apellido").value="";
			document.getElementById("fecha").value="";
			boton.innerHTML="Grabar";
		})
		
		.catch(function(error) {
			// The document probably doesn't exist.
			console.error("Error updating document: ", error);
		});

	}

	
}


