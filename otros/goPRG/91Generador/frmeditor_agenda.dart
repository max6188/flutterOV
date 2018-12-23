/// autor :MaxSoft
/// fecha :2018-09-15
/// correo:max82574971@gmail.com
/// github:max6188
/// objetivo:Editor de agenda médica
/// Version 1.0

import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';


import 'maxlib/mgrafica_comboV2.dart';
import 'maxlib/mvalidadorV1.dart';
import 'maxlib/mgrafica_fecha_calendarioV7.dart';
import 'maxlib/mgrafica_formatosV1.dart';
import 'maxlib/mform_camposV2.dart';
import 'maxlib/mgrafica_mensajeriaV1.dart';


class FrmEditorAgenda extends StatefulWidget {
    final String dBkey;
    final String nombreDB;

    FrmEditorAgenda({this.dBkey,this.nombreDB})
    @override

    _FrmEditorAgendaState()=> new _FrmEditorAgendaState
}

class _FrmEditorAgendaState extends State<FrmEditorAgenda>{

    //Generacion de variables
    String nombreDB=dbMedicina;
    bool lecturacompleta=false;
    final scaffoldKey = new GlobalKey<ScaffoldState>();
    final _formKey = new GlobalKey<FormState>();
    _dbAgenda dFrm = new _dbAgenda()
    mgraficaMensajeria mje = new mgraficaMensajeria();

    TextEditingController cuandoCtrl = new TextEditingController();
    final TextEditingController asuntoCtrl = new TextEditingController();
    final TextEditingController notaCtrl = new TextEditingController();


    Future<bool> willPop() async { 
    final FormState form = _formKey.currentState; 
    if (form == null || form.validate()) 
       return true; 
    
    return await showDialog<bool>( 
      context: context, 
      builder: (BuildContext context) { 
        return new AlertDialog(
          title: const Text('Pantalla contiene errores'),
          content: const Text('Realmente te vas?'),
          actions: <Widget>[
            new FlatButton(
              child: const Text('SI'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            new FlatButton(
              child: const Text('NO'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    ) ?? false;
    }

    Future<bool> cargaCita() async {
       /// Carga datos a clase dfrm
       Firestore.instance.collection(nombreDB).document(widget.dBkey).get().then((docSnap) {
         setState(() {
           dFrm.lectura(docSnap.data);
           lecturacompleta=true;
           return ;
         });
       });
       return false ;
    }

    void initState() {
       super.initState();
       dFrm.inicio();
          if(widget.dBkey.isNotEmpty){
            cargaCita().then((rta) {
              setState(() {
                  lecturacompleta=true;
              });
             });
       
          } else lecturacompleta=true;
    }

    void _submit() {
    	final form = _formKey.currentState;
    	if (form.validate()) {
    		form.save();
    		grabar();
    	}
    }

    void _grabar() {
       if(widget.dBkey.isEmpty) dbInsertaRegistro(dFrm,nombreDB) ;
       else dbModificaRegistro(dFrm,nombreDB,widget.dBkey);
       Navigator.of(context).pop(true);
    }

    //Operatoria con la base de datos
    void dbInsertaRegistro(dbAgenda d,String nombreDB){
      Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference =Firestore.instance.collection(nombreDB);
        await reference.add({
          'cuando': d.cuando,
          'donde': d.donde,
          'que': d.que,
          'quien': d.quien,
          'asunto': d.asunto,
          'nota': d.nota,
          'vencida': d.vencida,
          });
      });
    }

    void dbModificaAgenda(dbAgenda d,String nombreDB,String key) {
    Firestore.instance.collection(nombreDB).document(key).setData({
          'cuando': d.cuando,
          'donde': d.donde,
          'que': d.que,
          'quien': d.quien,
          'asunto': d.asunto,
          'nota': d.nota,
          'vencida': d.vencida,
    });

    //Tipos de datos
    //----------------------------------------

    Widget fechaCuando{
       	return new FechaCalendario(
       		  context: context,
       		  fechaOk: (DateTime dtFec) {
       			cuandoCtrl.text = formateoFechaL(dtFec);
       			dFrm.cuando = dtFec;
       		  },
       		  fechaDesde: new DateTime(2018, 09,01),
       		  fechaHasta: new DateTime(2030, 09,30),
       		  ctrlFecha: cuandoCtrl,
       		  hinText: "Fecha",
       		  labelText: "F.de Compromiso",
       		);
    }

    Widget comboDonde{
     return  new Combo(
    	lCosas: ["Consultorio","Hóspital","FPopular","Siquiatra","Otro"]
    	  primerValor: "Consultorio",
    	  onGetDD: (String value) {
    	  setState(() {
    		dFrm.donde = value;
    	  });
    	},
      );
    }

    Widget comboQue{
     return  new Combo(
    	lCosas: ["Medico", "Examen","Inyeccion"]
    	  primerValor: "Medico",
    	  onGetDD: (String value) {
    	  setState(() {
    		dFrm.que = value;
    	  });
    	},
      );
    }

    Widget comboQuien{
     return  new Combo(
    	lCosas: ["Mary", "Max","Ambos"]
    	  primerValor: "Mary",
    	  onGetDD: (String value) {
    	  setState(() {
    		dFrm.quien = value;
    	  });
    	},
      );
    }

    Widget asuntoAsunto{
    return new TextField(
      decoration: const InputDecoration(
        //border: const UnderlineInputBorder(),
        // filled: true,
        icon: const Icon("Icons.announcement"),
        hintText: "Cual es el asunto",
        labelText: "Asunto",
      ),
      controller: asuntoCtrl,
      keyboardType: TextInputType.text,
      onChanged: (String texto) {
        dFrm.asunto = texto;
      });
    }

    Widget memoNota{
    return new TextField(
      decoration: const InputDecoration(
        //border: const UnderlineInputBorder(),
        // filled: true,
        icon: const Icon("Nota"),
        hintText: 60,
        labelText: "Ingrese una nota",
      ),
      controller: notaCtrl,
      maxLines: 3,
      keyboardType: TextInputType.text,
      onChanged: (String texto) {
        dFrm.nota = texto;
      });
    }

    Row radioVencida() {
    return new Row(
    	mainAxisAlignment: MainAxisAlignment.spaceBetween,
    	children: <Widget>[
    	  new Radio(
            value:0,
            groupValue: dFrm.vencida,
            onChanged: (int data) {
    	     setState(() {
    	         dFrm.vencida = data;
          	 });
    }
    ),
    new Text("Pendiente"),

            value:1,
            groupValue: dFrm.vencida,
            onChanged: (int data) {
    	     setState(() {
    	         dFrm.vencida = data;
          	 });
    }
    ),
    new Text("Listo"),

            value:2,
            groupValue: dFrm.vencida,
            onChanged: (int data) {
    	     setState(() {
    	         dFrm.vencida = data;
          	 });
    }
    ),
    new Text("Vencida"),

    	],
      );
    }

    //principal
    @override
    Widget build(BuildContext context) {
        cuandoCtrl.text = formateoFechaL(dFrm.cuando);
        asuntoCtrl.text=dFrm.asunto;
        notaCtrl.text=dFrm.nota;
    return new Scaffold(
      key:scaffoldKey,
      appBar: new AppBar(
        title: new Center(child: Text(' "Editar"'))
      ),
      body: !lecturacompleta?mje.simpleCentrado(context,'Esperando servidor...'):
      new SafeArea(
          top: false,
          bottom: false,
          minimum:const EdgeInsets.only(top:10.0,left: 10.0,right:10.0,bottom: 10.0),
          child: new Container(
            decoration: new BoxDecoration(
              border: new Border.all(width: 10.0, color: Colors.black38),
              borderRadius:const BorderRadius.all(const Radius.circular(8.0)),
            ),
            child:new Form(
              key: _formKey,
              autovalidate: true,
              onWillPop: willPop,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                    fechaCuando(),
                    comboDonde(),
                    comboQue(),
                    comboQuien(),
                    asuntoAsunto(),
                    memoNota(),
                    radioVencida(),
                    new Container(
                       padding:const EdgeInsets.only(top:25.0),
                       child: new RaisedButton(
                            child: const Text("Grabar"),
                            onPressed: () {
                              _submit();
                            }
                        )
                    ),
                 ],
                )),
      )));
    }
}

//Clase de Datos
class dbAgenda {
    DateTime cuando;  //TD Fecha 
    String donde;     //TD combo 
    String que;     //TD combo 
    String quien;     //TD combo 
    String asunto;    //TD asunto 
    String nota;      //TD 
    int vencida;      //TD int 

inicio(){
    cuando=DateTime.now();
    donde="Consultorio";
    que="Medico";
    quien="Mary";
    asunto='';
    nota='';
    vencida="Pendiente";
}

lectura(Map snap){
  cuando= snap['cuando'];
  donde= snap['donde'];
  que= snap['que'];
  quien= snap['quien'];
  asunto= snap['asunto'];
  nota= snap['nota'];
  vencida= snap['vencida'];
}
}
