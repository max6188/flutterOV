package genericas

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

var prn = fmt.Println
var ft = fmt.Sprintf

func LeoFuente(name string) ([][]string, int, string) {
	mLineas := [][]string{}
	nuLin := 0
	numErr := 0
	tipoPrograma := "DUMMY"

	archivo, errFile := os.Open(name)
	defer func() {
		archivo.Close()
	}()
	if errFile != nil {
		prn(errFile)
	}

	scanner := bufio.NewScanner(archivo)
	for scanner.Scan() {
		lin := scanner.Text()
		nuLin++
		pS := strings.Index(lin, "//")

		if pS >= 0 {
			if pS == 0 {
				lin = ""
			} else {
				lin = lin[0:pS]
			}
		}
		if strings.Contains(lin, "=:") {
			numErr++
			s := ft(" Error linea '%2d' contiene =:", nuLin)
			prn(s)
		}

		comando := strings.Split(lin, ":=")
		if len(comando) > 2 {
			numErr++
			s := ft(" Error linea '%2d' muchos :=", nuLin)
			prn(s)
		}
		comando[0] = strings.TrimSpace(comando[0])

		resto := ""
		if len(comando) == 2 {
			resto = comando[1]
		}
		fila := []string{comando[0], resto}

		if comando[0] == "conversor" {
			tipoPrograma = comando[1]
		}

		mLineas = append(mLineas, fila)

	}
	if err := scanner.Err(); err != nil {
		prn("leyendo entrada:", err)
	}

	return mLineas, numErr, tipoPrograma

}

func ObtengoSeccion(lineas [][]string, seccion string) ([][]string, int) {
	l := [][]string{}
	numErr := 0
	parte := -1
	fin := -1

	for _, l := range lineas {
		parte++
		if l[0] == seccion {
			break
		}

	}

	for i := parte + 1; i < len(lineas); i = i + 1 {
		if lineas[i][1] == "" {
			fin = i
			break
		}

	}

	if parte == -1 || fin == -1 {
		numErr++

	} else {
		for i := parte; i < fin; i++ {
			l = append(l, lineas[i])
		}
	}
	return l, numErr
}

func ObtengoPareja(lineas [][]string, key string, puedeSerNulo bool) (string, int) {
	numErr := 0
	for i := 0; i < len(lineas); i++ {

		if lineas[i][0] == key {

			rta := sc(lineas[i][1])
			if rta == "" && !puedeSerNulo {
				s := ft(" Error en principal debe existir %s", key)
				prn(s)
				numErr++
			}
			return rta, numErr
		}

	}
	if !puedeSerNulo {
		s := ft(" Error en principal debe existir %s", key)
		prn(s)
		numErr++
	}
	return "", numErr
}

func ObtengoArreglo(lineas [][]string, key string) []string {

	for i := 0; i < len(lineas); i++ {

		if lineas[i][0] == key {
			mA := strings.Split(lineas[i][1], ",")
			for j := 0; j < len(mA); j++ {
				mA[j] = sc(mA[j])
			}
			return mA

		}

	}
	return []string{}

}

func ObtengoMatriz(lineas [][]string, key string) [][]string {
	l := [][]string{}
	for i := 0; i < len(lineas); i++ {

		if lineas[i][0] == key {
			mA := strings.Split(lineas[i][1], ",")
			for j := 0; j < len(mA); j++ {
				mA[j] = sc(mA[j])
			}
			l = append(l, mA)
		}
	}
	return l
}

//saco comillas
func sc(t string) string {
	s := strings.TrimSpace(t)
	if len(s) > 0 && s[0] == '"' {
		s = s[1:]
	}
	if len(s) > 0 && s[len(s)-1] == '"' {
		s = s[:len(s)-1]
	}
	return strings.TrimSpace(s)
}
