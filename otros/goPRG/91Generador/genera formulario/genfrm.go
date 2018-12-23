package main

import (
	"fmt"
	"bufio"
	"os"
	"strings"
	"strconv"
)	

type TPrincipal struct{
	conversor string
	database string
	titulo string
	objetivo string
	autor string
	fechaCreacion string
	carpetaFisica string
	libreriaFlutter string
	directorioGenerado string
	copiaLibreria string
}

type TEditor struct{
	nombreClase  string
	nombreArchivo string
	coleccion string
	claseData string
	parametro string
	varParametro string
	nombreSoporte string 
	willPopTitulo string
	willPopDescripcion  string
	carga string
}

type TData struct {
	tipo string
	nombre string
	token1 string
	token2 string
	token3 string
	token4 string
}

func main() {

	sw_principal:=false
	sw_editor:=false
	sw_data:=false
	sw_final:=false

	cabecera:=""
	

	nuLin:=0;
	numErr:=0;
	var principal TPrincipal 
	var editor TEditor
	

	var atributo []TData
	

	archivo,err:=os.Open("./genfrm.gen")
	if err != nil {
		fmt.Println("archivo no fue proporcionado")
	}
	fmt.Println("Comienza analizador lexico")
	scanner:=bufio.NewScanner(archivo)
	for scanner.Scan(){
		nuLin++
		linea:=scanner.Text();
		if strings.Contains(linea,"=:"){ numErr=imprimeLinea(" Error linea <%d> contiene =:",nuLin)}
		
		if strings.Contains(linea,"//"){
			continue
		
		}  
		
		comando:= strings.Split(linea, ":=")
		
			
		
	
		switch strings.TrimSpace(comando[0]) {
			//Cabecera principal
			case "principal":
				if sw_principal {numErr=imprimeLinea(" Error linea <%d> contiene token principal repetido ",nuLin)}
				
				sw_principal=true
				cabecera="principal"
			case "editor":
				if sw_editor {numErr=imprimeLinea("Error linea <%d> contiene token editor repetido ",nuLin)}
				
				if !sw_principal {numErr=imprimeLinea("Error linea <%d> falta token principal  ",nuLin)}
				sw_editor=true;
				cabecera="editor"
			case "data":
				if sw_data {numErr=imprimeLinea(" Error linea <%d> contiene token data repetido ",nuLin)}
				
				if !sw_editor { numErr=imprimeLinea("Error linea <%d> falta token editor",nuLin)}

				sw_data=true;
				cabecera="data"
			case "final":
				if sw_final {numErr=imprimeLinea("Error linea <%d> contiene token final repetido ",nuLin)}
		
         		if !sw_data { numErr=imprimeLinea("Error linea <%d> falta token data",nuLin)}
			
				sw_final=true;
				cabecera="final"
				
			//analisis de principal
			case "conversor":
			    comando[1]=sacoComillas(comando[1])
		        if cabecera!="principal" {numErr=imprimeLinea(".Error linea <%d> conversor  no esta en cabecera principal",nuLin)}

		        if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> conversor esta incompleto",nuLin)}
				
				if comando[1]!="editor" {numErr=imprimeLinea("Error linea <%d>  analizador sintáctico erroneo",nuLin)}
				
				principal.conversor=comando[1]
				
			case "database":
			    comando[1]=sacoComillas(comando[1])
		        if cabecera!="principal" { numErr=imprimeLinea("Error linea <%d> database  no esta en cabecera principal",nuLin)}
			
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> database esta incompleto",nuLin)}

				if comando[1]!="firestore" {numErr=imprimeLinea("Error linea <%d> database no soportadad",nuLin)}
		
				principal.database=comando[1]
					
			case "titulo":
				if cabecera!="principal" {numErr=imprimeLinea("Error linea <%d> titulo  no esta en cabecera principal",nuLin)}

				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> titulo esta incompleto",nuLin)}
			
     			principal.titulo=comando[1]
				
			case "objetivo":
			      comando[1]=sacoComillas(comando[1])
				if cabecera!="principal" {numErr=imprimeLinea("Error linea <%d> objetivo  no esta en cabecera principal",nuLin)}

				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> objetivo esta incompleto",nuLin)}
			
     			principal.objetivo=comando[1]
						
			case "autor":
			     comando[1]=sacoComillas(comando[1])
				if cabecera!="principal" {numErr=imprimeLinea("Error linea <%d> autor no esta en cabecera principal",nuLin)}
				
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> autor esta incompleto",nuLin)}
				
				principal.autor=comando[1]
			case "fechaCreacion":
			    comando[1]=sacoComillas(comando[1])
				if cabecera!="principal" {numErr=imprimeLinea("Error linea <%d> fechaCreacion  no esta en cabecera principal",nuLin)}
				
				
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> fechaCreacion esta incompleto",nuLin)}
								
				principal.fechaCreacion=comando[1]
				

			case "carpetaFisica":
			    comando[1]=sacoComillas(comando[1])
				if cabecera!="principal" {numErr=imprimeLinea("Error linea <%d> carpetaFisica  no esta en cabecera principal",nuLin)}
				
				
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> carpetaFisica esta incompleto",nuLin)}
				
				principal.carpetaFisica=comando[1]

			case "libreriaFlutter":	
			       comando[1]=sacoComillas(comando[1])
				if cabecera!="principal" {numErr=imprimeLinea("Error linea <%d> libreriaFlutter  no esta en cabecera principal",nuLin)}
			
				
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> libreriaFlutter esta incompleto",nuLin)}
				
				principal.libreriaFlutter=comando[1]

			case "directorioGenerado":
			       comando[1]=sacoComillas(comando[1])
				if cabecera!="principal" {numErr=imprimeLinea("Error linea <%d> directorioGenerado  no esta en cabecera principal",nuLin)}
						
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> ditrectorioGenerado esta incompleto",nuLin)}
			
				principal.directorioGenerado=comando[1]
			case "copiaLibreria":
			    comando[1]=sacoComillas(comando[1])
				if cabecera!="principal" {numErr=imprimeLinea("Error linea <%d> copiaLibreria  no esta en cabecera principal",nuLin)}

				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> copiaLibreria esta incompleto",nuLin)}
				
				if comando[1]!="si" && comando[1]!="no" {numErr=imprimeLinea("Error linea <%d> copiaLibreria debe ser si o no",nuLin)}
				
				
				principal.copiaLibreria=comando[1]
				
			//Editor
				
			case "nombre":	
			    comando[1]=sacoComillas(comando[1])
				if cabecera!="editor" { numErr=imprimeLinea("Error linea <%d> nombre  no esta en cabecera editor",nuLin)}
				

				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> nombre esta incompleto",nuLin)}
						
				comNombre:= strings.Split(comando[1], "=>")
				
				
				if len(comNombre)!=2 {numErr=imprimeLinea("Error linea <%d> nombre esta mal formado",nuLin)}
			
				editor.nombreClase=sacoComillas(comNombre[0])
				editor.nombreArchivo=sacoComillas(comNombre[1])
			case "coleccion":
				//coleccion:="dbMedicina"
				if cabecera!="editor" { numErr=imprimeLinea("Error linea <%d> coleccion  no esta en cabecera editor",nuLin)}
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> coleccion esta incompleto",nuLin)}
				
				editor.coleccion=sacoComillas(comando[1])
			case "claseData":
				//claseData:="dbAgenda"
				if cabecera!="editor" { numErr=imprimeLinea("Error linea <%d> claseData  no esta en cabecera editor",nuLin)}
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> claseData esta incompleto",nuLin)}
				
				editor.claseData=sacoComillas(comando[1])

				
			case "nombreSoporte":
			  
			   comando[1]=sacoComillas(comando[1])
				if cabecera!="editor" {numErr=imprimeLinea("Error linea <%d> nombreSoporte  no esta en cabecera editor",nuLin)}
				

				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> nombreSoporte esta incompleto",nuLin)}
					
				editor.nombreSoporte =comando[1]
	        case "parametro":
			    //parametro:=  "final String dBkey;","final String nombreDB;"
				//comando[1]=sacoComillas(comando[1])
				if cabecera!="editor" {numErr=imprimeLinea("Error linea <%d> parametro  no esta en cabecera editor",nuLin)}
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> parametro esta incompleto",nuLin)}
				
				comNombre:= strings.Split(comando[1], ",")
				
				if len(comNombre)>=4 {numErr=imprimeLinea("Error linea <%d> fecha esta mal formada",nuLin)}
			
				coma:=""
				for i:=0;i<len(comNombre);i++ {
				    miPar:=sacoComillas(comNombre[i])
					editor.parametro=editor.parametro+coma+miPar;
					
							 
					 j:=strings.LastIndex( miPar, " " )
					 editor.varParametro=editor.varParametro+coma + miPar[j+1:len(miPar)-1]
					 
					 coma=","
				}
						
			 
				
			case "willPopTitulo":
			    comando[1]=sacoComillas(comando[1])
				if cabecera!="editor" {numErr=imprimeLinea("Error linea <%d> willPopTitulo  no esta en cabecera editor",nuLin)}
			    if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> willPopTitulo esta incompleto",nuLin)}

				editor.willPopTitulo =comando[1]
			case "willPopDescripcion":
				comando[1]=sacoComillas(comando[1])
				if cabecera!="editor" {numErr=imprimeLinea("Error linea <%d> willPopDescripcion  no esta en cabecera editor",nuLin)}
			
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> willPopDescripcion esta incompleto",nuLin)}
				
				editor.willPopDescripcion =comando[1]
					
			case "carga":
				comando[1]=sacoComillas(comando[1])
				if cabecera!="editor" { numErr=imprimeLinea("Error linea <%d> carga  no esta en cabecera editor",nuLin)}
				
				if len(comando)!=2 { numErr=imprimeLinea("Error linea <%d> carga esta incompleto",nuLin)}
				
				editor.carga =comando[1]
			
			//Data
			case "fecha":
			    //="cuando"=>"01/09/2018","30/09/2030","Fecha","F.de Compromiso"
				//comando[1]=sacoComillas(comando[1])
				if cabecera!="data" {numErr=imprimeLinea("Error linea <%d> fecha  no esta en cabecera data",nuLin)}
	
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> fecha esta incompleto",nuLin)}

				comNombre:= strings.Split(comando[1], "=>")
				
				if len(comNombre)!=2 { numErr=imprimeLinea("Error linea <%d> fecha esta mal formada",nuLin)}
				
				expr:= strings.Split(comNombre[1], ",")
				
				if len(expr)!=4 {numErr=imprimeLinea("Error linea <%d> fecha esta muy mal formada",nuLin)}
				
				
				aF1:=validaFechaLatina(sacoComillas(expr[0]));
			   if aF1  !="" {numErr=imprimeLinea(aF1,0)}
					
				aF2:=validaFechaLatina(sacoComillas(expr[0]));
			   if aF2  !="" { numErr=imprimeLinea(aF2,0)}
			
			
			    var t TData
				t.tipo =strings.TrimSpace(comando[0])
				t.nombre=sacoComillas(comNombre[0])
				t.token1=sacoComillas(expr[0])
				t.token2=sacoComillas(expr[1])
				t.token3=expr[2]
				t.token4=expr[3]
				atributo=append(atributo,t)
			
			case "combo":
			   //	combo:="donde"=>"Consultorio","Hóspital","FPopular","Siquiatra","Otro"=>"Consultorio"
			   //comando[1]=sacoComillas(comando[1])
				if cabecera!="data" {numErr=imprimeLinea("Error linea %d combo  no esta en cabecera data",nuLin)}
				
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> combo esta incompleto",nuLin)}
				
				comNombre:= strings.Split(comando[1], "=>")
				
				if len(comNombre)!=3 {numErr=imprimeLinea("Error linea <%d> combo esta mal formado",nuLin)}
				
				  //ESTE TROZO DEBE SER CAMBIADO
				  elementos:=strings.Split(comNombre[1], ",")
				  eEnc:="";
				  for i:=0;elementos[i]==comNombre[2];i++{
					eEnc=elementos[i]
				  }	
				  if eEnc!=comNombre[2] { numErr=imprimeLinea("Error linea <%d> combo inicio, no esta en lista",nuLin)}
				  
				
			    var t TData
				t.tipo =strings.TrimSpace(comando[0])
				t.nombre=sacoComillas(comNombre[0])
				t.token1=comNombre[1]
				t.token2=comNombre[2]
				t.token3=""
				t.token4=""
				atributo=append(atributo,t)
			
			
			case "asunto":
				//"asunto"=>"30","Cual es el asunto","Asunto","icono"
				 //comando[1]=sacoComillas(comando[1])
				 
				if cabecera!="data" {numErr=imprimeLinea("Error linea %d asunto  no esta en cabecera data",nuLin)}
			

				if len(comando)!=2  {numErr=imprimeLinea("Error linea <%d> asunto esta incompleto",nuLin)}
			
				comNombre:= strings.Split(comando[1], "=>")
				
				
				if len(comNombre)!=2 {numErr=imprimeLinea("Error linea <%d> asunto esta mal formada",nuLin)}
				
				expr:= strings.Split(comNombre[1], ",")
				
				if len(expr)!=4 {numErr=imprimeLinea("Error linea <%d> asunto esta muy mal formada",nuLin) }
				
				
				_, err := strconv.Atoi(expr[0])
				if err ==nil{numErr=imprimeLinea("Error linea <%d> mal número de caracteres",nuLin)}
				
				
				
			
			    var t TData
				t.tipo =strings.TrimSpace(comando[0])
				t.nombre=sacoComillas(comNombre[0])
				t.token1=sacoComillas(expr[0])
				t.token2=expr[1]
				t.token3=expr[2]
				t.token4=expr[3]
				
				atributo=append(atributo,t)
				
			case "memo":
			      //"nota"=>"3","60","Ingrese una nota","Nota"
				 //comando[1]=sacoComillas(comando[1])
				 
				if cabecera!="data" {numErr=imprimeLinea("Error linea %d memo  no esta en cabecera data",nuLin)}
				

				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> memo esta incompleto",nuLin)}
			
				comNombre:= strings.Split(comando[1], "=>")
				
				
				if len(comNombre)!=2 {numErr=imprimeLinea("Error linea <%d> memo esta mal formada",nuLin)}
	
				expr:= strings.Split(comNombre[1], ",")
				if len(expr)!=4 {numErr=imprimeLinea("Error linea <%d> memo esta muy mal formada",nuLin)}
				
				_, err := strconv.Atoi(expr[0])
				if err ==nil{numErr=imprimeLinea("Error linea <%d> mal número de lineas",nuLin)}
				
				_, err2 := strconv.Atoi(expr[1])
				if err2 ==nil{numErr=imprimeLinea("Error linea <%d> mal número de caracteres",nuLin)}
			
			    var t TData
				t.tipo =strings.TrimSpace(comando[0])
				t.nombre=sacoComillas(comNombre[0])
				t.token1=sacoComillas(expr[0])
				t.token2=sacoComillas(expr[1])
				t.token3=expr[2]
				t.token4=expr[3]
				atributo=append(atributo,t)
				  
			case "radio":
			   //radio:="vencida"=>"Pendiente","Listo","Vencida"=>"Pendiente"
			    //comando[1]=sacoComillas(comando[1])
				if cabecera!="data" {numErr=imprimeLinea("Error linea %d radio  no esta en cabecera data",nuLin)}

				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> radio esta incompleto",nuLin)}
			
				comNombre:= strings.Split(comando[1], "=>")
				
				
				if len(comNombre)!=3 {numErr=imprimeLinea(" Error linea <%d> radio esta mal formado",nuLin)}

			
			    var t TData
				t.tipo =strings.TrimSpace(comando[0])
				t.nombre=sacoComillas(comNombre[0])
				t.token1=comNombre[1]
				t.token2=comNombre[2]
				t.token3=""
				t.token4=""
				atributo=append(atributo,t)
			
            case "boton":
				//boton:="grabar","Grabar","Icono"
				 //  comando[1]=sacoComillas(comando[1])
				if cabecera!="data" {numErr=imprimeLinea("Error linea %d boton  no esta en cabecera data",nuLin)}
	
				if len(comando)!=2 {numErr=imprimeLinea("Error linea <%d> boton esta incompleto",nuLin)}

				comNombre:= strings.Split(comando[1], ",")
		    	if len(comNombre)!=3 {numErr=imprimeLinea("Error linea <%d> boton  esta muy mal formado",nuLin)}
				
				var t TData
				t.tipo =strings.TrimSpace(comando[0])
				t.nombre=sacoComillas(comNombre[0])
				t.token1=comNombre[1]
				t.token2=comNombre[2]
				t.token3=""
				t.token4=""
				atributo=append(atributo,t)
		
		
		
			default:
			    numErr=imprimeLinea("Error linea %d Comando no  reconocido "+comando[0],nuLin)
				numErr++
		} 
		
		
	      
	} //for
	
	if numErr!= 0 {numErr=imprimeLinea("***existen errores lexicos,cuello",0)}
	
	//Existencia de principal
	numErr=imprimeLinea("Comienza Analizador de completitud",0)
	
	
    if principal.conversor=="" {numErr=imprimeLinea("Debe ingresar conversor",0)}
		
	
	if principal.titulo=="" {numErr=imprimeLinea("Debe ingresar titulo",0)}
	if principal.objetivo=="" {numErr=imprimeLinea("Debe ingresar objetivo",0)}
	

	
	if principal.autor=="" {numErr=imprimeLinea("Debe ingresar autor",0)}
	
	if principal.fechaCreacion=="" {numErr=imprimeLinea("Debe ingresar fechaCreacion",0)}
	
	if principal.carpetaFisica=="" {numErr=imprimeLinea("Debe ingresar carpetaFisica",0)}
	
	if principal.libreriaFlutter=="" {numErr=imprimeLinea("Debe ingresar libreriaFlutter",0)}

	
	if principal.directorioGenerado=="" {numErr=imprimeLinea("Debe ingresar directorioGenerado",0)}

	
	if principal.copiaLibreria=="" {numErr=imprimeLinea("Debe ingresar copiaLibreria",0)}
		
	
	//Existencia de editor
	
	if editor.nombreClase=="" {numErr=imprimeLinea("Debe ingresar nombreClase",0)}
	
	if editor.coleccion=="" {numErr=imprimeLinea("Debe ingresar coleccion",0)}
	
	
	if editor.claseData=="" {numErr=imprimeLinea("Debe ingresar nombreClase",0)}
	
	if editor.nombreArchivo=="" {numErr=imprimeLinea("Debe ingresar nombreArchivo",0)}
				
	if editor.parametro=="" {numErr=imprimeLinea("Debe ingresar Parámetro",0)}
	
	if editor.nombreSoporte=="" {numErr=imprimeLinea("Debe ingresar nombreSoporte",0)}
	
	if editor.willPopTitulo=="" {numErr=imprimeLinea("Debe ingresar willPopTitulo",0)}

	if editor.willPopDescripcion=="" {numErr=imprimeLinea("Debe ingresar willPopDescripcion",0)}
		
	if editor.carga=="" {numErr=imprimeLinea("Debe ingresar carga",0)}
		
	if numErr!= 0 {numErr=imprimeLinea("Existen errores de completitud",0)}
			
	
	if len(atributo)== 0 {numErr=imprimeLinea("Atributos deben ser ingresados",0)}
		
	///////////////////////////////////////////////////////////////////	
	if numErr!=0 {return}
	numErr=imprimeLinea("Comienza construccion de fuentes",0)
	numErr=imprimeLinea("Comienza construccion de "+editor.nombreArchivo+".dart",0)
	
	///////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////
	
	
	f, err := os.Create(editor.nombreArchivo+".dart")
    if err != nil {
        panic(err)
    }
    // close fo on exit and check for its returned error
    defer func() {
        if err := f.Close(); err != nil {
            panic(err)
        }
    }()

	 FL:="\n"
	 f.WriteString("/// autor :"+principal.autor+FL)
	 f.WriteString("/// fecha :"+principal.fechaCreacion+FL)
	 f.WriteString("/// correo:max82574971@gmail.com"+FL)
	 f.WriteString("/// github:max6188"+FL)
	 f.WriteString("/// objetivo:"+principal.objetivo+FL)
	 f.WriteString("/// Version 1.0"+FL) 
	 
	 f.WriteString(FL)
	 
	f.WriteString("import 'dart:async';"+FL)
	f.WriteString("import 'dart:io';"+FL)
	f.WriteString("import 'package:cloud_firestore/cloud_firestore.dart';"+FL)
	f.WriteString("import 'package:flutter/material.dart';"+FL)
	f.WriteString("import 'package:flutter/services.dart';"+FL)
	f.WriteString("import 'package:intl/intl.dart';"+FL)
	f.WriteString("import 'package:flutter/widgets.dart';"+FL)
	f.WriteString(FL)
	f.WriteString(FL)
	f.WriteString("import 'maxlib/mgrafica_comboV2.dart';"+FL)
	f.WriteString("import 'maxlib/mvalidadorV1.dart';"+FL)
	f.WriteString("import 'maxlib/mgrafica_fecha_calendarioV7.dart';"+FL)
	f.WriteString("import 'maxlib/mgrafica_formatosV1.dart';"+FL)
	f.WriteString("import 'maxlib/mform_camposV2.dart';"+FL)
	f.WriteString("import 'maxlib/mgrafica_mensajeriaV1.dart';"+FL)
	f.WriteString(FL)
	f.WriteString(FL)
	
	//class FrmAgenda extends StatefulWidget {
	f.WriteString("class "+editor.nombreClase+" extends StatefulWidget {"+FL)
	par:= strings.Split(editor.parametro, ",")
	for i:=0;i<len(par);i++{
		f.WriteString("    "+par[i]+FL)
	
	}
	coma:=""
	linPar:=""
	vPar:= strings.Split(editor.varParametro, ",")
	for i:=0;i<len(par);i++{
	    linPar=linPar+coma + "this."+vPar[i]
		coma=","
	}
	f.WriteString(FL)
	f.WriteString("    "+editor.nombreClase+"({"+linPar+"})"+FL)
   // FrmAgenda({this.dBkey,this.nombreDB}); 
  

	f.WriteString("    @override"+FL)
	f.WriteString(FL)
	f.WriteString("    _"+editor.nombreClase+"State()=> new _"+editor.nombreClase+"State" +FL)
	//_FrmAgenda createState() => new _FrmAgenda();
	f.WriteString("}"+FL)
	
	f.WriteString(FL)
	//class _FrmAgenda extends State<FrmAgenda> {
    f.WriteString("class _"+editor.nombreClase+"State extends State<"+editor.nombreClase+">{"+FL)


	f.WriteString(FL)
	f.WriteString("    //Generacion de variables"+FL)
	f.WriteString("    String nombreDB="+editor.coleccion+";"+FL)
	f.WriteString("    bool lecturacompleta=false;"+FL)
	f.WriteString("    final scaffoldKey = new GlobalKey<ScaffoldState>();"+FL)
	f.WriteString("    final _formKey = new GlobalKey<FormState>();"+FL)
	f.WriteString("    _"+editor.claseData +" dFrm = new _"+editor.claseData+"()"+FL)
	f.WriteString("    mgraficaMensajeria mje = new mgraficaMensajeria();"+FL)

	f.WriteString(FL)

	
	for i:=0;i<len(atributo);i++ {
			var t TData
			t=atributo[i]
			switch t.tipo {
			case "fecha":
				f.WriteString("    TextEditingController "+t.nombre+"Ctrl = new TextEditingController();"+FL)
			case "combo":
			case "asunto":
			    f.WriteString("    final TextEditingController "+t.nombre+"Ctrl = new TextEditingController();"+FL)
			case "memo":
				f.WriteString("    final TextEditingController "+t.nombre+"Ctrl = new TextEditingController();"+FL)  
			case "radio":
			
			case "boton":
			default:
				fmt.Println("Error:Tipo de dato no reconocido:"+t.tipo)
				numErr++
			
			}
	}
	f.WriteString(FL)
	f.WriteString(FL)
	f.WriteString("    Future<bool> willPop() async { "+FL)
    f.WriteString("    final FormState form = _formKey.currentState; "+FL)
    f.WriteString("    if (form == null || form.validate()) "+FL)
    f.WriteString("       return true; "+FL)
	f.WriteString("    "+FL)

    f.WriteString("    return await showDialog<bool>( "+FL)
    f.WriteString("      context: context, "+FL)
    f.WriteString("      builder: (BuildContext context) { "+FL)
    f.WriteString("        return new AlertDialog("+FL)
    f.WriteString("          title: const Text('"+editor.willPopTitulo +"'),"+FL)
    f.WriteString("          content: const Text('"+editor.willPopDescripcion+"'),"+FL)
    f.WriteString("          actions: <Widget>["+FL)
    f.WriteString("            new FlatButton("+FL)
    f.WriteString("              child: const Text('SI'),"+FL)
    f.WriteString("              onPressed: () {"+FL)
    f.WriteString("                Navigator.of(context).pop(true);"+FL)
    f.WriteString("              },"+FL)
    f.WriteString("            ),"+FL)
    f.WriteString("            new FlatButton("+FL)
    f.WriteString("              child: const Text('NO'),"+FL)
    f.WriteString("              onPressed: () {"+FL)
    f.WriteString("                Navigator.of(context).pop(false);"+FL)
    f.WriteString("              },"+FL)
    f.WriteString("            ),"+FL)
    f.WriteString("          ],"+FL)
    f.WriteString("        );"+FL)
    f.WriteString("      },"+FL)
    f.WriteString("    ) ?? false;"+FL)
    f.WriteString("    }"+FL)
	f.WriteString(FL)

 
	f.WriteString("    Future<bool> "+editor.carga+"() async {"+FL)
	f.WriteString("       /// Carga datos a clase dfrm"+FL)
	f.WriteString("       Firestore.instance.collection(nombreDB).document(widget.dBkey).get().then((docSnap) {"+FL)
	f.WriteString("         setState(() {"+FL)
	f.WriteString("           dFrm.lectura(docSnap.data);"+FL)
	f.WriteString("           lecturacompleta=true;"+FL)
	f.WriteString("           return ;"+FL)
	f.WriteString("         });"+FL)
	f.WriteString("       });"+FL)
	f.WriteString("       return false ;"+FL)
	f.WriteString("    }"+FL)
    f.WriteString(FL)
 
    f.WriteString("    void initState() {"+FL)
	f.WriteString("       super.initState();"+FL)
	f.WriteString("       dFrm.inicio();"+FL)
	f.WriteString("          if(widget.dBkey.isNotEmpty){"+FL)
	f.WriteString("            cargaCita().then((rta) {"+FL)
	f.WriteString("              setState(() {"+FL)
	f.WriteString("                  lecturacompleta=true;"+FL)
	f.WriteString("              });"+FL)
	f.WriteString("             });"+FL)
	f.WriteString("       "+FL)
	f.WriteString("          } else lecturacompleta=true;"+FL)
	f.WriteString("    }"+FL)
	f.WriteString(FL)
	
	f.WriteString("    void _submit() {"+FL)
	f.WriteString("    	final form = _formKey.currentState;"+FL)
	f.WriteString("    	if (form.validate()) {"+FL)
	f.WriteString("    		form.save();"+FL)
	f.WriteString("    		grabar();"+FL)
	f.WriteString("    	}"+FL)
	f.WriteString("    }"+FL)
	f.WriteString(FL)
	
	f.WriteString("    void _grabar() {"+FL)
    f.WriteString("       if(widget.dBkey.isEmpty) dbInsertaRegistro(dFrm,nombreDB) ;"+FL)
    f.WriteString("       else dbModificaRegistro(dFrm,nombreDB,widget.dBkey);"+FL)
    f.WriteString("       Navigator.of(context).pop(true);"+FL)
    f.WriteString("    }"+FL)
	f.WriteString(FL)

	f.WriteString("    //Operatoria con la base de datos"+FL)	
	f.WriteString("    void dbInsertaRegistro("+editor.claseData+" d,String nombreDB){"+FL)
	f.WriteString("      Firestore.instance.runTransaction((Transaction transaction) async {"+FL)
	f.WriteString("        CollectionReference reference =Firestore.instance.collection(nombreDB);"+FL)
	f.WriteString("        await reference.add({"+FL)
	for i:=0;i<len(atributo);i++ {
			var t TData
			t=atributo[i]
			switch t.tipo {
			case "fecha":
				f.WriteString("          '"+t.nombre +"': d."+t.nombre+","+FL)
			case "combo":
				f.WriteString("          '"+t.nombre +"': d."+t.nombre+","+FL)
			case "asunto":
			    f.WriteString("          '"+t.nombre +"': d."+t.nombre+","+FL)
			case "memo":
			    f.WriteString("          '"+t.nombre +"': d."+t.nombre+","+FL)
			case "radio":
			    f.WriteString("          '"+t.nombre +"': d."+t.nombre+","+FL)
			case "boton":
			default:
				fmt.Println("Error:Tipo de dato no reconocido:"+t.tipo)
				numErr++
			
			}
	}
	f.WriteString("          });"+FL)
	f.WriteString("      });"+FL)
	f.WriteString("    }"+FL)	
	f.WriteString(FL)

  f.WriteString("    void dbModificaAgenda("+editor.claseData+" d,String nombreDB,String key) {"+FL)	
  f.WriteString("    Firestore.instance.collection(nombreDB).document(key).setData({"+FL)	
  for i:=0;i<len(atributo);i++ {
			var t TData
			t=atributo[i]
			switch t.tipo {
			case "fecha":
				f.WriteString("          '"+t.nombre +"': d."+t.nombre+","+FL)
			case "combo":
				f.WriteString("          '"+t.nombre +"': d."+t.nombre+","+FL)
			case "asunto":
			    f.WriteString("          '"+t.nombre +"': d."+t.nombre+","+FL)
			case "memo":
			    f.WriteString("          '"+t.nombre +"': d."+t.nombre+","+FL)
			case "radio":
			    f.WriteString("          '"+t.nombre +"': d."+t.nombre+","+FL)
			case "boton":
			default:
				fmt.Println("Error:Tipo de dato no reconocido:"+t.tipo)
				numErr++
			
			}
	}
 f.WriteString("    });"+FL)	
 f.WriteString(FL)
	
	
	f.WriteString("    //Tipos de datos"+FL)
	f.WriteString("    //----------------------------------------"+FL)
	f.WriteString(FL)
	//Genero los campos
	for i:=0;i<len(atributo);i++ {
			var t TData
			t=atributo[i]
			switch t.tipo {
			case "fecha":
					fec1:=strings.Split(t.token1, "/")
					fec2:=strings.Split(t.token2, "/")
			        
					f.WriteString("    Widget fecha"+strings.Title(t.nombre)+"{"+FL)
					f.WriteString("       	return new FechaCalendario("+FL)
					f.WriteString("       		  context: context,"+FL)
					f.WriteString("       		  fechaOk: (DateTime dtFec) {"+FL)
					f.WriteString("       			"+t.nombre+"Ctrl.text = formateoFechaL(dtFec);"+FL)
					f.WriteString("       			dFrm."+t.nombre+" = dtFec;"+FL)
					f.WriteString("       		  },"+FL)
					f.WriteString("       		  fechaDesde: new DateTime("+fec1[2]+", "+fec1[1]+","+fec1[0]+"),"+FL)
					f.WriteString("       		  fechaHasta: new DateTime("+fec2[2]+", "+fec2[1]+","+fec2[0]+"),"+FL)
					f.WriteString("       		  ctrlFecha: "+t.nombre+"Ctrl,"+FL)
					f.WriteString("       		  hinText: "+t.token3+","+FL)
					f.WriteString("       		  labelText: "+t.token4+","+FL)
					f.WriteString("       		);"+FL)
					f.WriteString("    }"+FL)
					f.WriteString(FL)

						
			case "combo":
			       
				    f.WriteString("    Widget combo"+strings.Title(t.nombre)+"{"+FL)
					f.WriteString("     return  new Combo("+FL)
					f.WriteString("    	lCosas: ["+t.token1+"]"+FL)
					f.WriteString("    	  primerValor: "+t.token2+","+FL)
					f.WriteString("    	  onGetDD: (String value) {"+FL)
					f.WriteString("    	  setState(() {"+FL)
					f.WriteString("    		dFrm."+t.nombre+" = value;"+FL)
					f.WriteString("    	  });"+FL)
					f.WriteString("    	},"+FL)
					f.WriteString("      );"+FL)
					f.WriteString("    }"+FL)
					f.WriteString(FL)
			case "asunto":
					f.WriteString("    Widget asunto"+strings.Title(t.nombre)+"{"+FL)
					f.WriteString("    return new TextField("+FL)
                    f.WriteString("      decoration: const InputDecoration("+FL)
                    f.WriteString("        //border: const UnderlineInputBorder(),"+FL)
                    f.WriteString("        // filled: true,"+FL)
                    f.WriteString("        icon: const Icon("+t.token4+"),"+FL)
                    f.WriteString("        hintText: "+t.token2+","+FL)
                    f.WriteString("        labelText: "+t.token3+","+FL)
                    f.WriteString("      ),"+FL)
                    f.WriteString("      controller: "+t.nombre+"Ctrl,"+FL)
                    f.WriteString("      keyboardType: TextInputType.text,"+FL)
                    f.WriteString("      onChanged: (String texto) {"+FL)
                    f.WriteString("        dFrm."+t.nombre+" = texto;"+FL)
                    f.WriteString("      });"+FL)
                    f.WriteString("    }"+FL)
					f.WriteString(FL)
			case "memo":
					
					f.WriteString("    Widget memo"+strings.Title(t.nombre)+"{"+FL)
					f.WriteString("    return new TextField("+FL)
                    f.WriteString("      decoration: const InputDecoration("+FL)
                    f.WriteString("        //border: const UnderlineInputBorder(),"+FL)
                    f.WriteString("        // filled: true,"+FL)
                    f.WriteString("        icon: const Icon("+t.token4+"),"+FL)
                    f.WriteString("        hintText: "+t.token2+","+FL)
                    f.WriteString("        labelText: "+t.token3+","+FL)
                    f.WriteString("      ),"+FL)
                    f.WriteString("      controller: "+t.nombre+"Ctrl,"+FL)
					f.WriteString("      maxLines: "+t.token1+","+FL)
                    f.WriteString("      keyboardType: TextInputType.text,"+FL)
                    f.WriteString("      onChanged: (String texto) {"+FL)
                    f.WriteString("        dFrm."+t.nombre+" = texto;"+FL)
                    f.WriteString("      });"+FL)
                    f.WriteString("    }"+FL)
					f.WriteString(FL)
			case "radio":
					f.WriteString("    Row radio"+strings.Title(t.nombre)+"() {"+FL)
					f.WriteString("    return new Row("+FL)
					f.WriteString("    	mainAxisAlignment: MainAxisAlignment.spaceBetween,"+FL)
					f.WriteString("    	children: <Widget>["+FL)
				              f.WriteString("    	  new Radio("+FL)
					elementos:=strings.Split(t.token1, ",")
					for i:=0;i<len(elementos);i++{
					    li:= strconv.Itoa(i)
							  f.WriteString("            value:"+li+","+FL)
							  f.WriteString("            groupValue: dFrm."+t.nombre+","+FL)
							  f.WriteString("            onChanged: (int data) {"+FL)
							  f.WriteString("    	     setState(() {"+FL)
							  f.WriteString("    	         dFrm."+t.nombre+" = data;"+FL)
							  f.WriteString("          	 });"+FL)
							  f.WriteString("    }"+FL)
							  f.WriteString("    ),"+FL)
						      f.WriteString("    new Text("+elementos[i]+"),"+FL)
							  f.WriteString(FL)
					 
					}	  
					f.WriteString("    	],"+FL)
					f.WriteString("      );"+FL)
					f.WriteString("    }"+FL)			
					f.WriteString(FL)
			case "boton":
			default:
				fmt.Println("Error:Tipo de dato no reconocido:"+t.tipo)
				numErr++
			
			}
	}
	
	//Comienza main
	f.WriteString("    //principal"+FL)
	f.WriteString("    @override"+FL)
    f.WriteString("    Widget build(BuildContext context) {"+FL)
	for i:=0;i<len(atributo);i++ {
			var t TData
			t=atributo[i]
			switch t.tipo {
			case "fecha":
			     f.WriteString("        "+t.nombre+"Ctrl.text = formateoFechaL(dFrm."+t.nombre+");"+FL)
			case "combo":
			case "asunto":
				f.WriteString("        "+t.nombre+"Ctrl.text=dFrm."+t.nombre+";"+FL)
			case "memo":
				f.WriteString("        "+t.nombre+"Ctrl.text=dFrm."+t.nombre+";"+FL)
			case "radio":
			case "boton":
			default:
				fmt.Println("Error:Tipo de dato no reconocido:"+t.tipo)
				numErr++
			
			}
	}
	 
      f.WriteString("    return new Scaffold("+FL)
      f.WriteString("      key:scaffoldKey,"+FL)
      f.WriteString("      appBar: new AppBar("+FL)
      f.WriteString("        title: new Center(child: Text('"+principal.titulo+"'))"+FL)
      f.WriteString("      ),"+FL)
      f.WriteString("      body: !lecturacompleta?mje.simpleCentrado(context,'Esperando servidor...'):"+FL)
      f.WriteString("      new SafeArea("+FL)
      f.WriteString("          top: false,"+FL)
      f.WriteString("          bottom: false,"+FL)
      f.WriteString("          minimum:const EdgeInsets.only(top:10.0,left: 10.0,right:10.0,bottom: 10.0),"+FL)
      f.WriteString("          child: new Container("+FL)
      f.WriteString("            decoration: new BoxDecoration("+FL)
      f.WriteString("              border: new Border.all(width: 10.0, color: Colors.black38),"+FL)
      f.WriteString("              borderRadius:const BorderRadius.all(const Radius.circular(8.0)),"+FL)
	  f.WriteString("            ),"+FL)
      f.WriteString("            child:new Form("+FL)
      f.WriteString("              key: _formKey,"+FL)
      f.WriteString("              autovalidate: true,"+FL)
      f.WriteString("              onWillPop: willPop,"+FL)
      f.WriteString("              child: new ListView("+FL)
      f.WriteString("                padding: const EdgeInsets.symmetric(horizontal: 16.0),"+FL)
      f.WriteString("                children: <Widget>["+FL)
	
      for i:=0;i<len(atributo);i++ {
			var t TData
			t=atributo[i]
			switch t.tipo {
			case "fecha":
				f.WriteString("                    fecha"+strings.Title(t.nombre)+"(),"+FL)
			case "combo":
				f.WriteString("                    combo"+strings.Title(t.nombre)+"(),"+FL)
			case "asunto":
				f.WriteString("                    asunto"+strings.Title(t.nombre)+"(),"+FL)
			case "memo":
				f.WriteString("                    memo"+strings.Title(t.nombre)+"(),"+FL)
			case "radio":
				f.WriteString("                    radio"+strings.Title(t.nombre)+"(),"+FL)
			case "boton":
			        f.WriteString("                    new Container("+FL)
                    f.WriteString("                       padding:const EdgeInsets.only(top:25.0),"+FL)
                    f.WriteString("                       child: new RaisedButton("+FL)
                    f.WriteString("                            child: const Text("+t.token1+"),"+FL)
                    f.WriteString("                            onPressed: () {"+FL)
                    f.WriteString("                              _submit();"+FL)
                    f.WriteString("                            }"+FL)
                    f.WriteString("                        )"+FL)
					f.WriteString("                    ),"+FL)
			default:
				fmt.Println("Error:Tipo de dato no reconocido:"+t.tipo)
				numErr++
	        }
	  }
  
	f.WriteString("                 ],"+FL)
	f.WriteString("                )),"+FL)
	f.WriteString("      )));"+FL)
	f.WriteString("    }"+FL)
	f.WriteString("}"+FL)
	f.WriteString(FL)
	
	f.WriteString("//Clase de Datos"+FL)
	f.WriteString("class "+editor.claseData+" {"+FL)

	  for i:=0;i<len(atributo);i++ {
			var t TData
			t=atributo[i] 
			switch t.tipo {
			case "fecha":
				f.WriteString("    DateTime " +t.nombre+";  //TD Fecha "+FL)
			case "combo":
				f.WriteString("    String "+t.nombre+";     //TD combo "+FL)
			case "asunto":
				f.WriteString("    String "+t.nombre+";    //TD asunto "+FL)
			case "memo":
				f.WriteString("    String "+t.nombre+";      //TD "+FL)
			case "radio":
				f.WriteString("    int "+t.nombre+";      //TD int "+FL)
			case "boton":
			default:
				fmt.Println("Error:Tipo de dato no reconocido:"+t.tipo)
				numErr++
	        }
     }
	 

f.WriteString(FL)
f.WriteString("inicio(){"+FL)

 for i:=0;i<len(atributo);i++ {
			var t TData
			t=atributo[i] 
			switch t.tipo {
			case "fecha":
				f.WriteString("    "+t.nombre+"=DateTime.now();"+FL)
			case "combo":
				f.WriteString("    "+t.nombre+"="+t.token2+";"+FL)
			case "asunto":
				 f.WriteString("    "+t.nombre+"='';"+FL)
			case "memo":
				f.WriteString("    "+t.nombre+"='';"+FL)
			case "radio":
			      elementos:=strings.Split(t.token1, ",")
				  eEnc:="";
				  for i:=0;elementos[i]==t.token2;i++{
					eEnc=elementos[i]
				  }	
			    f.WriteString("    "+t.nombre+"="+eEnc+";"+FL)
			case "boton":
			default:
				fmt.Println("Error:Tipo de dato no reconocido:"+t.tipo)
				numErr++
	        }
   }

 
	f.WriteString("}"+FL)
	f.WriteString(FL)

	f.WriteString("lectura(Map snap){"+FL)
	for i:=0;i<len(atributo);i++ {
		var t TData
		t=atributo[i] 
		switch t.tipo {
		case "fecha":
			f.WriteString("  "+t.nombre+"= snap['"+t.nombre+"'];"+FL)
		case "combo":
			f.WriteString("  "+t.nombre+"= snap['"+t.nombre+"'];"+FL)
		case "asunto":
			f.WriteString("  "+t.nombre+"= snap['"+t.nombre+"'];"+FL)
		case "memo":
			f.WriteString("  "+t.nombre+"= snap['"+t.nombre+"'];"+FL)
		case "radio":
			f.WriteString("  "+t.nombre+"= snap['"+t.nombre+"'];"+FL)
		case "boton":
		default:
			fmt.Println("Error:Tipo de dato no reconocido:"+t.tipo)
			numErr++
		}
	}


f.WriteString("}"+FL)

f.WriteString("}"+FL)
	
	
}




func sacoComillas(s string) string {
    s=strings.TrimSpace(s)
	if len(s) > 0 && s[0] == '"' {
		s = s[1:]
	}
	if len(s) > 0 && s[len(s)-1] == '"' {
		s = s[:len(s)-1]
	}
	return s
}

func imprimeLinea(lin string, nl int) int {
	if nl==0 {
		fmt.Println(lin)
		return 0
	} else {
		fmt.Println(lin,nl)
		return 1
	}	
}

func validaFechaLatina(f string) string {
  aFec := strings.Split(f, "/")
  if len(aFec) != 3 { return "-1, no es una fecha"}
  _, errDia := strconv.Atoi(aFec[0])
  if errDia !=nil{ return "-2 , dia mal digitado" }
  
  _, errMes := strconv.Atoi(aFec[1])
  if errMes !=nil{ return "-3 , mes mal digitado" }
  _, errAnio := strconv.Atoi(aFec[1])
  if errAnio !=nil{ return "-4 , anio mal digitado" }
  
 
 
  return "";
  
  
}