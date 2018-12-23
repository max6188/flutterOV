package main

import (
	"fmt"
	"os"
	"strings"

	"./genericas"
	"./scaffold"
	"./tipos"
)

var prn = fmt.Println
var ft = fmt.Sprintf
const FL string = "\n"


func main() {
	var principal tipos.TPrincipal
	var sca tipos.TScaffold
	numErr := 0

	if len(os.Args) != 2 {
		prn("Falta archivo a procesar")
		return

	}
	archivo := os.Args[1]

	mLineas, errLectura, tipoPrograma := genericas.LeoFuente(archivo)
	if errLectura > 0 {
		prn("Error de lectura..archivo no sera procesado")
		return
	}
	switch strings.TrimSpace(tipoPrograma) {
	case "EDITOR":

	case "SCAFFOLD":
		prn("Revisando analizador ....")
		principal, sca, numErr = scaffold.AnalLexico(mLineas)
		if numErr > 0 {
			prn("********Token mal ingresados")
			return
		}

		numErr := scaffold.AnalGramatical(principal, sca)
		if numErr > 0 {
			prn("********analisis gramatica incorrecto")
			return
		}

		numErr = scaffold.ConstruyoScaffold(principal, sca)
		if numErr > 0 {
			prn("********Construcción incorrecta")
			return
		}

	default:
		prn("Tipo de programa no existe:", tipoPrograma)
	}

	prn(principal)
	prn(sca)
}
