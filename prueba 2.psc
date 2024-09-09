Proceso HomeBanking
	
    // Variables globales
    Definir cuentas Como Entero
    Dim cuenta[100] Como Caracter
    Dim saldo[100] Como Real
    Dim nombre[100] Como Caracter
    Dim dni[100] Como Caracter
    Dim estado[100] Como Caracter
    Dim celular[100] Como Caracter
    Dim i, opcion, numCuenta, encontrado Como Entero
    Dim nuevoSaldo Como Real
    cuentas = 10 // Iniciamos con 10 cuentas pre-registradas
	
    // Función para generar un número de cuenta de 10 dígitos aleatorio
    Funcion numCuenta <- GenerarNumeroCuenta()
        Definir numCuenta Como Caracter
        numCuenta = ""
        Para i = 1 Hasta 10 Con Paso 1 Hacer
            numCuenta = numCuenta + ConvertirATexto(Aleatorio(0, 9))
        FinPara
        Retornar numCuenta
FinFuncion

// Función para validar un número de cuenta
Funcion posicion <- ValidarCuenta(numCuenta)
	Para i = 1 Hasta cuentas Con Paso 1 Hacer
		Si cuenta[i] = numCuenta Entonces
			Retornar i
		FinSi
	FinPara
	Retornar 0
FinFuncion

// Función para buscar cuenta por DNI
Funcion posicion <- BuscarPorDNI(dniCliente)
	Para i = 1 Hasta cuentas Con Paso 1 Hacer
		Si dni[i] = dniCliente Entonces
			Retornar i
		FinSi
	FinPara
	Retornar 0
FinFuncion

// Subproceso para inicializar base de datos con 10 clientes
SubProceso InicializarBaseDatos
	// Datos de prueba
	nombre[1] = "Juan Pérez"
	dni[1] = "12345678A"
	cuenta[1] = "1234567890"
	saldo[1] = 1500
	estado[1] = "ACTIVA"
	celular[1] = "600123456"
	
	nombre[2] = "María López"
	dni[2] = "23456789B"
	cuenta[2] = "0987654321"
	saldo[2] = 3200
	estado[2] = "ACTIVA"
	celular[2] = "600234567"
	
	nombre[3] = "Carlos Ruiz"
	dni[3] = "34567890C"
	cuenta[3] = "1234987654"
	saldo[3] = 2100
	estado[3] = "ACTIVA"
	celular[3] = "600345678"
	
	nombre[4] = "Ana Martínez"
	dni[4] = "45678901D"
	cuenta[4] = "9876123456"
	saldo[4] = 1800
	estado[4] = "ACTIVA"
	celular[4] = "600456789"
	
	nombre[5] = "Luis Fernández"
	dni[5] = "56789012E"
	cuenta[5] = "6543219876"
	saldo[5] = 2300
	estado[5] = "ACTIVA"
	celular[5] = "600567890"
	
	nombre[6] = "Elena Gómez"
	dni[6] = "67890123F"
	cuenta[6] = "1928374650"
	saldo[6] = 2750
	estado[6] = "ACTIVA"
	celular[6] = "600678901"
	
	nombre[7] = "Miguel Torres"
	dni[7] = "78901234G"
	cuenta[7] = "5647382910"
	saldo[7] = 2950
	estado[7] = "ACTIVA"
	celular[7] = "600789012"
	
	nombre[8] = "Lucía Romero"
	dni[8] = "89012345H"
	cuenta[8] = "8473625140"
	saldo[8] = 3100
	estado[8] = "ACTIVA"
	celular[8] = "600890123"
	
	nombre[9] = "Pablo Sánchez"
	dni[9] = "90123456I"
	cuenta[9] = "4758693201"
	saldo[9] = 3300
	estado[9] = "ACTIVA"
	celular[9] = "600901234"
	
	nombre[10] = "Isabel García"
	dni[10] = "01234567J"
	cuenta[10] = "3847261590"
	saldo[10] = 2900
	estado[10] = "ACTIVA"
	celular[10] = "600012345"
FinSubProceso

// Llamada a inicializar la base de datos
InicializarBaseDatos()

Repetir
	// Menú principal del sistema
	Escribir "===== MENU PRINCIPAL ====="
	Escribir "1. Abrir cuenta"
	Escribir "2. Consignar"
	Escribir "3. Retirar"
	Escribir "4. Cerrar cuenta"
	Escribir "5. Actualizar datos del cliente"
	Escribir "6. Consultar cliente"
	Escribir "7. Reporte de cuentas"
	Escribir "8. Estadísticas"
	Escribir "9. Recargar saldo"
	Escribir "0. Salir"
	Leer opcion
	
	Segun opcion Hacer
		Caso 1:
			// Abrir nueva cuenta
			cuentas = cuentas + 1
			Escribir "Ingrese el nombre del
			Escribir "Ingrese el nombre del cliente:"
			Leer nombre[cuentas]
			Escribir "Ingrese el DNI del cliente:"
			Leer dni[cuentas]
			Escribir "Ingrese el número de celular del cliente:"
			Leer celular[cuentas]
			cuenta[cuentas] = GenerarNumeroCuenta()
			saldo[cuentas] = 0
			estado[cuentas] = "ACTIVA"
			Escribir "Cuenta creada exitosamente. Número de cuenta: ", cuenta[cuentas]
			
		Caso 2:
			// Consignar dinero
			Escribir "Ingrese el número de cuenta:"
			Leer numCuenta
			i = ValidarCuenta(numCuenta)
			Si i > 0 Entonces
				Si estado[i] = "ACTIVA" Entonces
					Escribir "Ingrese el monto a consignar:"
					Leer nuevoSaldo
					saldo[i] = saldo[i] + nuevoSaldo
					Escribir "Consignación exitosa. Nuevo saldo: ", saldo[i]
				SiNo
					Escribir "La cuenta está cerrada."
				FinSi
			SiNo
				Escribir "Cuenta no encontrada."
			FinSi
			
		Caso 3:
			// Retirar dinero
			Escribir "Ingrese el número de cuenta:"
			Leer numCuenta
			i = ValidarCuenta(numCuenta)
			Si i > 0 Entonces
				Si estado[i] = "ACTIVA" Entonces
					Escribir "Ingrese el monto a retirar:"
					Leer nuevoSaldo
					Si saldo[i] >= nuevoSaldo Entonces
						saldo[i] = saldo[i] - nuevoSaldo
						Escribir "Retiro exitoso. Nuevo saldo: ", saldo[i]
					SiNo
						Escribir "Fondos insuficientes."
					FinSi
				SiNo
					Escribir "La cuenta está cerrada."
				FinSi
			SiNo
				Escribir "Cuenta no encontrada."
			FinSi
			
		Caso 4:
			// Cerrar cuenta
			Escribir "Ingrese el número de cuenta:"
			Leer numCuenta
			i = ValidarCuenta(numCuenta)
			Si i > 0 Entonces
				Si estado[i] = "ACTIVA" Entonces
					estado[i] = "CERRADA"
					Escribir "Cuenta cerrada exitosamente."
				SiNo
					Escribir "La cuenta ya está cerrada."
				FinSi
			SiNo
				Escribir "Cuenta no encontrada."
			FinSi
			
		Caso 5:
			// Actualizar datos del cliente
			Escribir "Ingrese el número de cuenta:"
			Leer numCuenta
			i = ValidarCuenta(numCuenta)
			Si i > 0 Entonces
				Escribir "Ingrese el nuevo nombre (dejar en blanco para no cambiar):"
				Leer nuevoNombre
				Si nuevoNombre <> "" Entonces
					nombre[i] = nuevoNombre
				FinSi
				Escribir "Ingrese el nuevo DNI (dejar en blanco para no cambiar):"
				Leer nuevoDNI
				Si nuevoDNI <> "" Entonces
					dni[i] = nuevoDNI
				FinSi
				Escribir "Ingrese el nuevo número de celular (dejar en blanco para no cambiar):"
				Leer nuevoCelular
				Si nuevoCelular <> "" Entonces
					celular[i] = nuevoCelular
				FinSi
				Escribir "Datos actualizados exitosamente."
			SiNo
				Escribir "Cuenta no encontrada."
			FinSi
			
		Caso 6:
			// Consultar cliente
			Escribir "Ingrese el DNI del cliente:"
			Leer dniCliente
			i = BuscarPorDNI(dniCliente)
			Si i > 0 Entonces
				Escribir "Datos del Cliente:"
				Escribir "Nombre: ", nombre[i]
				Escribir "DNI: ", dni[i]
				Escribir "Número de cuenta: ", cuenta[i]
				Escribir "Saldo: ", saldo[i]
				Escribir "Estado: ", estado[i]
				Escribir "Celular: ", celular[i]
			SiNo
				Escribir "Cliente no encontrado."
			FinSi
			
		Caso 7:
			// Reporte de cuentas
			Escribir "Reporte de Cuentas:"
			Para i = 1 Hasta cuentas Con Paso 1 Hacer
				Escribir "Número de cuenta: ", cuenta[i]
				Escribir "Nombre: ", nombre[i]
				Escribir "DNI: ", dni[i]
				Escribir "Saldo: ", saldo[i]
				Escribir "Estado: ", estado[i]
				Escribir "Celular: ", celular[i]
				Escribir "----------------------------"
			FinPara
			
		Caso 8:
			// Estadísticas
			Definir totalSaldo Como Real
			Definir cuentasActivas, cuentasCerradas Como Entero
			totalSaldo = 0
			cuentasActivas = 0
			cuentasCerradas = 0
			Para i = 1 Hasta cuentas Con Paso 1 Hacer
				totalSaldo = totalSaldo + saldo[i]
				Si estado[i] = "ACTIVA" Entonces
					cuentasActivas = cuentasActivas + 1
				SiNo
					cuentasCerradas = cuentasCerradas + 1
				FinSi
			FinPara
			Escribir "Total de cuentas: ", cuentas
			Escribir "Total saldo en el banco: ", totalSaldo
			Escribir "Cuentas activas: ", cuentasActivas
			Escribir "Cuentas cerradas: ", cuentasCerradas
			
		Caso 9:
			// Recargar saldo a celular
			Escribir "Ingrese el número de cuenta:"
			Leer numCuenta
			i = ValidarCuenta(numCuenta)
			Si i > 0 Entonces
				Si estado[i] = "ACTIVA" Entonces
					Escribir "Ingrese el monto a recargar:"
					Leer nuevoSaldo
					Si saldo[i] >= nuevoSaldo Entonces
						saldo[i] = saldo[i] - nuevoSaldo
						Escribir "Recarga exitosa. Nuevo saldo: ", saldo[i]
					SiNo
						Escribir "Fondos insuficientes."
					FinSi
				SiNo
					Escribir "La cuenta está cerrada."
				FinSi
			SiNo
				Escribir "Cuenta no encontrada."
			FinSi
			
		Caso 0:
			// Salir del sistema
			Escribir "Gracias por usar nuestro sistema de Home Banking."
	FinSegun
Hasta Que opcion = 0

FinProceso

