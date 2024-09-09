Algoritmo HomeBanking
	// Declaración de variables principales
	Definir cuentas Como Entero
	Dimension  cuenta[100] 
	Dimension  saldo[100] 
	Dimension  nombre[100] 
	Dimension  dni[100] 
	Dimension  estado[100] 
	Definir   i, opciones, numCuenta, encontrado  Como Entero
	Definir   nuevoSaldo Como Real
	cuentas = 0
	
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
		Leer opciones
		
		Segun opciones Hacer
			Caso 1:
				// Abrir nueva cuenta
				cuentas = cuentas + 1
				Escribir "Ingrese el nombre del cliente:"
				Leer nombre[cuentas]
				Escribir "Ingrese el DNI del cliente:"
				Leer dni[cuentas]
				saldo[cuentas] = 0
				estado[cuentas] = "ACTIVA"
				cuenta[cuentas] = cuentas
				Escribir "Cuenta abierta con éxito. Número de cuenta: ", cuenta[cuentas]
				
			Caso 2:
				// Consignar dinero
				Escribir "Ingrese el número de cuenta:"
				Leer numCuenta
				encontrado = 0
				Para i = 1 Hasta cuentas Hacer
					Si cuenta[i] = numCuenta Entonces
						Si estado[i] = "ACTIVA" Entonces
							Escribir "Ingrese el monto a consignar:"
							Leer nuevoSaldo
							saldo[i] = saldo[i] + nuevoSaldo
							Escribir "Consignación exitosa. Nuevo saldo: ", saldo[i]
							encontrado = 1
						SiNo
							Escribir "La cuenta está cerrada."
						FinSi
					FinSi
				FinPara
				Si encontrado = 0 Entonces
					Escribir "Cuenta no encontrada."
				FinSi
				
			Caso 3:
				// Retirar dinero
				Escribir "Ingrese el número de cuenta:"
				Leer numCuenta
				encontrado = 0
				Para i = 1 Hasta cuentas Hacer
					Si cuenta[i] = numCuenta Entonces
						Si estado[i] = "ACTIVA" Entonces
							Escribir "Ingrese el monto a retirar:"
							Leer nuevoSaldo
							Si saldo[i] >= nuevoSaldo Entonces
								saldo[i] = saldo[i] - nuevoSaldo
								Escribir "Retiro exitoso. Nuevo saldo: ", saldo[i]
							SiNo
								Escribir "Fondos insuficientes."
							FinSi
							encontrado = 1
						SiNo
							Escribir "La cuenta está cerrada."
						FinSi
					FinSi
				FinPara
				Si encontrado = 0 Entonces
					Escribir "Cuenta no encontrada."
				FinSi
				
			Caso 4:
				// Cerrar cuenta
				Escribir "Ingrese el número de cuenta:"
				Leer numCuenta
				encontrado = 0
				Para i = 1 Hasta cuentas Hacer
					Si cuenta[i] = numCuenta Entonces
						Si estado[i] = "ACTIVA" Entonces
							estado[i] = "CERRADA"
							Escribir "Cuenta cerrada con éxito."
							encontrado = 1
						SiNo
							Escribir "La cuenta ya está cerrada."
						FinSi
					FinSi
				FinPara
				Si encontrado = 0 Entonces
					Escribir "Cuenta no encontrada."
				FinSi
				
			Caso 5:
				// Actualizar datos del cliente
				Escribir "Ingrese el número de cuenta:"
				Leer numCuenta
				encontrado = 0
				Para i = 1 Hasta cuentas Hacer
					Si cuenta[i] = numCuenta Entonces
						Escribir "Ingrese el nuevo nombre del cliente:"
						Leer nombre[i]
						Escribir "Ingrese el nuevo DNI del cliente:"
						Leer dni[i]
						Escribir "Datos actualizados con éxito."
						encontrado = 1
					FinSi
				FinPara
				Si encontrado = 0 Entonces
					Escribir "Cuenta no encontrada."
				FinSi
				
			Caso 6:
				// Consultar cliente
				Escribir "Ingrese el número de cuenta:"
				Leer numCuenta
				encontrado = 0
				Para i = 1 Hasta cuentas Hacer
					Si cuenta[i] = numCuenta Entonces
						Escribir "Nombre del cliente: ", nombre[i]
						Escribir "DNI del cliente: ", dni[i]
						Escribir "Saldo actual: ", saldo[i]
						Escribir "Estado de la cuenta: ", estado[i]
						encontrado = 1
					FinSi
				FinPara
				Si encontrado = 0 Entonces
					Escribir "Cuenta no encontrada."
				FinSi
				
			Caso 7:
				// Reporte de cuentas
				Escribir "===== REPORTE DE CUENTAS ====="
				Para i = 1 Hasta cuentas Hacer
					Escribir "Número de cuenta: ", cuenta[i]
					Escribir "Nombre del cliente: ", nombre[i]
					Escribir "Saldo: ", saldo[i]
					Escribir "Estado: ", estado[i]
					Escribir "----------------------------"
				FinPara
				
			Caso 8:
				// Estadísticas
				Definir totalSaldo Como Real
				Definir cuentasActivas, cuentasCerradas Como Entero
				totalSaldo = 0
				cuentasActivas = 0
				cuentasCerradas = 0
				Para i = 1 Hasta cuentas Hacer
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
				// Recargar saldo
				Escribir "Ingrese el número de cuenta:"
				Leer numCuenta
				encontrado = 0
				Para i = 1 Hasta cuentas Hacer
					Si cuenta[i] = numCuenta Entonces
						Escribir "Ingrese el monto a recargar:"
						Leer nuevoSaldo
						saldo[i] = saldo[i] + nuevoSaldo
						Escribir "Recarga exitosa. Nuevo saldo: ", saldo[i]
						encontrado = 1
					FinSi
				FinPara
				Si encontrado = 0 Entonces
					Escribir "Cuenta no encontrada."
				FinSi
				
			Caso 0:
				// Salir del sistema
				Escribir "Gracias por usar nuestro sistema de Home Banking."
		FinSegun
	Hasta Que opciones = 0
FinAlgoritmo

