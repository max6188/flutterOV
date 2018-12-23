package tipos

type TPrincipal struct {
	Conversor     string
	Database      string
	Titulo        string
	Objetivo      string
	Autor         string
	FechaCreacion string
	NombreArchivo string
	NombreClase   string
	Home          string
}

type TScaffold struct {
	FButton      []string //floatingActionButton
	DrawerHeader []string
	DrawerLinea  [][]string

	AcercaDeHeader  []string
	AcercaDeVersion string
	AcercaDeNombre  []string

	TabLinea [][]string
	Botonera [][]string
}
