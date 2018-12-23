package scaffold

import (
	"fmt"
	"os"

	"../genericas"
	"../tipos"
)

var prn = fmt.Println
var ft = fmt.Sprintf

const FL string = "\n"

func AnalLexico(mLineas [][]string) (tipos.TPrincipal, tipos.TScaffold, int) {
	var principal tipos.TPrincipal
	var scaffold tipos.TScaffold
	numErr := 0

	lPrincipal, errDec := genericas.ObtengoSeccion(mLineas, "principal")
	if errDec != 0 {
		prn("token Principal no existe")
		numErr++
	}
	e1, e2, e3, e4, e5, e6, e7, e8, e9 := 0, 0, 0, 0, 0, 0, 0, 0, 0
	principal.Conversor, e1 = genericas.ObtengoPareja(lPrincipal, "conversor", false)
	principal.Database, e2 = genericas.ObtengoPareja(lPrincipal, "database", true)
	principal.Titulo, e3 = genericas.ObtengoPareja(lPrincipal, "titulo", false)
	principal.Objetivo, e4 = genericas.ObtengoPareja(lPrincipal, "objetivo", false)
	principal.Autor, e5 = genericas.ObtengoPareja(lPrincipal, "autor", false)
	principal.FechaCreacion, e6 = genericas.ObtengoPareja(lPrincipal, "fechaCreacion", false)
	principal.NombreArchivo, e7 = genericas.ObtengoPareja(lPrincipal, "nombreArchivo", false)
	principal.NombreClase, e8 = genericas.ObtengoPareja(lPrincipal, "nombreClase", false)
	principal.Home, e9 = genericas.ObtengoPareja(lPrincipal, "home", true)
	numErr += e1 + e2 + e3 + e4 + e5 + e6 + e7 + e8 + e9

	lEditor, errDec := genericas.ObtengoSeccion(mLineas, "editor")
	if errDec == 0 {
		scaffold.FButton = genericas.ObtengoArreglo(lEditor, "floatingActionButton")
	}

	lDrawer, errDec := genericas.ObtengoSeccion(mLineas, "drawer")
	if errDec == 0 {
		scaffold.DrawerHeader = genericas.ObtengoArreglo(lDrawer, "header")
		scaffold.DrawerLinea = genericas.ObtengoMatriz(lDrawer, "linea")

	}

	lAcercaDe, errDec := genericas.ObtengoSeccion(mLineas, "acercaDe")
	if errDec == 0 {
		scaffold.AcercaDeHeader = genericas.ObtengoArreglo(lAcercaDe, "header")
		scaffold.AcercaDeVersion, errDec = genericas.ObtengoPareja(lAcercaDe, "version", false)
		scaffold.AcercaDeNombre = genericas.ObtengoArreglo(lAcercaDe, "nombre")
		numErr += errDec
	}

	lTab, errDec := genericas.ObtengoSeccion(mLineas, "tab")
	if errDec == 0 {
		scaffold.TabLinea = genericas.ObtengoMatriz(lTab, "linea")
	} else {
		numErr++
	}

	lBotonera, errDec := genericas.ObtengoSeccion(mLineas, "botonera")
	if errDec == 0 {
		scaffold.Botonera = genericas.ObtengoMatriz(lBotonera, "linea")

	}

	return principal, scaffold, numErr
}

func AnalGramatical(principal tipos.TPrincipal, sca tipos.TScaffold) int {
	numErr := 0
	if principal.Home == "" && sca.TabLinea == nil {
		prn("debe indicar home")
		numErr++
	}

	if principal.Home != "" && sca.TabLinea != nil {
		prn("Debe definir home o tab")
		numErr++
	}

	for _, l := range sca.DrawerLinea {
		if l[0] != "PANTALLA" && l[0] != "METODO" {
			prn("Las líneas de drawer deben ser PANTALLA ó METODO==>", l[0])
			numErr++
		}
	}

	for _, l := range sca.TabLinea {
		if l[0] != "ICONO" && l[0] != "TEXTO" && l[0] != "" {
			prn("Las líneas de tab deben ser TEXTO ó ICONO ó Vacío==>", l[0])
			numErr++
		}
	}

	for _, l := range sca.Botonera {
		if l[0] != "ICONO" {
			prn("Las líneas de botoner deben ser ICONO =>", l[0])
			numErr++
		}
	}
	return numErr

}

func ConstruyoScaffold(principal tipos.TPrincipal, sca tipos.TScaffold) int {
	numErr := 0
	if principal.NombreArchivo == "" {
		prn("principal.nombreArchivo debe ser ingresado")
		numErr++
	}

	f, err := os.Create(principal.NombreArchivo + ".tmp")

	if err != nil {
		prn("Error creación", err)
		numErr++
	}
	defer func() {
		if err := f.Close(); err != nil {
			prn("Error al cierre")
			numErr++
		}
	}()

	ConstruyeCabecera(f ,principal, sca)
	

    numErr += construyeDrawer(f, sca)

	return numErr
}

func ConstruyeCabecera(f *os.File,principal tipos.TPrincipal,sca tipos.TScaffold)  {
		f.WriteString("/// autor :" + principal.Autor + FL)
		f.WriteString("/// fecha :" + principal.FechaCreacion + FL)
		f.WriteString("/// correo:max82574971@gmail.com" + FL)
		f.WriteString("/// github:max6188" + FL)
		f.WriteString("/// objetivo:" + principal.Objetivo + FL)
		f.WriteString("/// Version 1.0" + FL)
		f.WriteString(FL)
		f.WriteString("import 'package:flutter/material.dart';" + FL)
		f.WriteString(FL)
		f.WriteString(FL)

		f.WriteString("class " + principal.NombreClase + " extends StatefulWidget {" + FL)
		f.WriteString("    @override" + FL)
		f.WriteString("    _" + principal.NombreClase + " createState() => new _" + principal.NombreClase + "();" + FL)
		f.WriteString("}" + FL)

		if sca.TabLinea != nil {
			f.WriteString("class _" + principal.NombreClase + " extends State<" + principal.NombreClase + "> with SingleTickerProviderStateMixin {" + FL)
			f.WriteString("    TabController controller;" + FL)
		} else {
			f.WriteString("class _" + principal.NombreClase + " extends State<" + principal.NombreClase + ">  {" + FL)
		}
		nTab := ft("%d", len(sca.TabLinea))
		f.WriteString(FL)
		f.WriteString("    @override" + FL)
		f.WriteString("    void initState() {" + FL)
		f.WriteString("       super.initState();" + FL)
		f.WriteString("       controller = new TabController(length:" + nTab + ", vsync: this);" + FL)
		f.WriteString("    }" + FL)

}
func construyeDrawer(f *os.File, sca tipos.TScaffold) int {

	FL := "\n"
	if sca.DrawerHeader[0] == "" {
		return 0
	}
	f.WriteString(FL)
	f.WriteString("    Drawer _getDrawer(BuildContext context) {" + FL)
	f.WriteString("        var header  = new  DrawerHeader(" + FL)
	f.WriteString("        child: Text('" + sca.DrawerHeader[0] + "')," + FL)
	if sca.DrawerHeader[1] != "" {
		f.WriteString("        decoration: BoxDecoration(" + FL)
		f.WriteString("            color: " + sca.DrawerHeader[1] + "," + FL)
		f.WriteString("        )," + FL)
		f.WriteString("    );" + FL)
	}

	if sca.AcercaDeHeader[0] != "" {
		f.WriteString(FL)
		f.WriteString("    var info = new AboutListTile(" + FL)
		f.WriteString("        child: new Text('" + sca.AcercaDeHeader[0] + "'), " + FL)
		f.WriteString("        applicationVersion:'" + sca.AcercaDeVersion + "'," + FL)
		f.WriteString("    	   applicationName:'" + sca.AcercaDeNombre[0] + "'," + FL)
		f.WriteString("        applicationIcon: new Icon(" + sca.AcercaDeNombre[1] + ")," + FL)
		f.WriteString("        icon: new Icon(" + sca.AcercaDeHeader[1] + ")," + FL)
		f.WriteString("      );" + FL)
	}

	if len(sca.DrawerLinea) != 0 {
		f.WriteString(FL)
		f.WriteString("    ListTile _getItem(Icon icon, String description, String route){" + FL)
		f.WriteString("       return new ListTile(" + FL)
		f.WriteString("           leading: icon," + FL)
		f.WriteString("           title: new Text(description)," + FL)
		f.WriteString("           onTap: () {" + FL)
		f.WriteString("           setState(() {" + FL)
		f.WriteString("               if(route!='') Navigator.of(context).pushNamed(route);" + FL)
		f.WriteString("               else {" + FL)
		f.WriteString("               }" + FL)
		f.WriteString("		      })" + FL)
		f.WriteString("	  });" + FL)
		f.WriteString("   }" + FL)

		
	}
	return 0
}
