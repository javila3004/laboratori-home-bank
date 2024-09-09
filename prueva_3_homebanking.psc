Algoritmo HomeBanking
    // Declaración de variables principales
    Definir cuentas Como Entero
    Dimension cuenta[100]
    Dimension saldo[100]
    Dimension nombre[100]
    Dimension dni[100]
    Dimension estado[100]
    Definir opciones Como Entero
	
    cuentas = 10 // Empezar con 10 cuentas ya existentes 
    
    // Inicialización de las cuentas ficticias
    InicializarDatos(cuentas, nombre, dni, cuenta, saldo, estado)
    
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
                AbrirCuenta(cuentas, nombre, dni, cuenta, saldo, estado)
            Caso 2:
                ModificarSaldo(cuentas, cuenta, saldo, estado, dni, "consignar")
            Caso 3:
                ModificarSaldo(cuentas, cuenta, saldo, estado, dni,"retirar")
            Caso 4:
                CambiarEstado(cuentas, cuenta, estado, "CERRADA")
            Caso 5:
                ActualizarDatos(cuentas, cuenta, nombre, dni)
            Caso 6:
                ConsultarCliente(cuentas, cuenta, nombre, dni, saldo, estado)
            Caso 7:
                ReporteCuentas(cuentas, cuenta, nombre, saldo, estado)
            Caso 8:
                Estadisticas(cuentas, saldo, estado)
            Caso 9:
                ModificarSaldo(cuentas, cuenta, saldo, estado, dni, "recargar")
            Caso 0:
                Escribir "Gracias por usar nuestro sistema de Home Banking."
        FinSegun
    Hasta Que opciones = 0
FinAlgoritmo

// Función para inicializar los datos de las cuentas
Funcion InicializarDatos(cuentas, nombre, dni, cuenta, saldo, estado)
	nombre[0] = "Juan Manuel Maldonado"
    dni[0]= "44157966"
    cuenta[0]= 1000000001 
    saldo[0]= 12000
    estado[0]= "ACTIVA"
	
	nombre[1] = "Juan Avilla"
    dni[1]= "26109785"
    cuenta[1]= 1000000002
    saldo[1]= 1750
    estado[1]= "ACTIVA"
	
	nombre[2] = "Santiago Armoha"
    dni[2]= "46442659"
    cuenta[2]= 1000000003 
    saldo[2]= 700
    estado[2]= "ACTIVA"
	
	nombre[3] = "Milagros Figueroa"
    dni[3]= "45303256"
    cuenta[3]= 1000000004 
    saldo[3]= 3000
    estado[3]= "ACTIVA"
	
	nombre[4] = "Jhonatan Vasquez"
    dni[4]= "30179664"
    cuenta[4]= 1000000005 
    saldo[4]= 6000
    estado[4]= "ACTIVA"
	
	nombre[5] = "Mayra osa"
    dni[5]= "45809132"
    cuenta[5]= 1000000006 
    saldo[5]= 1500
    estado[5]= "ACTIVA"
	
	nombre[6] = "Carlos Gil"
    dni[6]= "10576913"
    cuenta[6]= 1000000007 
    saldo[6]= 4580
    estado[6]= "ACTIVA"
	
	nombre[7] = "Ezequiel Martinez"
    dni[7]= "44165978"
    cuenta[7]= 1000000008 
    saldo[7]= 2000
    estado[7]= "ACTIVA"
	
	nombre[8] = "Yasmin Morales"
    dni[8]= "26309725"
    cuenta[8]= 1000000009 
    saldo[8]= 3050
    estado[8]= "ACTIVA"
	
	nombre[9] = "Felipe Pintado"
    dni[9]= "50698499"
    cuenta[9]= 1000000010 
    saldo[9]= 1100
    estado[9]= "ACTIVA"
FinFuncion

// Función para abrir una nueva cuenta
Funcion AbrirCuenta(cuentas, nombre, dni, cuenta, saldo, estado)
    Si cuentas >= 100 Entonces
        Escribir "Límite máximo de cuentas alcanzado."
    SiNo
        Escribir "Ingrese el nombre del cliente:"
        Leer nombre[cuentas]
        Escribir "Ingrese el DNI del cliente:"
        Leer dni[cuentas]
        cuenta[cuentas] = 1000000000 + cuentas // Generar número de cuenta secuencial
        saldo[cuentas] = 0
        estado[cuentas] = "ACTIVA"
        Escribir "Cuenta abierta con éxito. Número de cuenta: ", cuenta[cuentas]
        cuentas = cuentas + 1
    FinSi
FinFuncion

// Función para modificar saldo (consignar, retirar, recargar)
Funcion ModificarSaldo(cuentas, cuenta, saldo, estado, dni, operacion)
    Definir numDni Como Cadena
    Definir monto Como Real
    Definir i Como Entero
    Definir cuentaEncontrada Como Entero
	
    Escribir "Ingrese su DNI:"
    Leer numDni
	
    cuentaEncontrada = 0  // Inicialmente, no se ha encontrado la cuenta
	
    Para i = 0 Hasta cuentas - 1 Hacer
        Si dni[i] = numDni Entonces
            Si estado[i] = "ACTIVA" Entonces
                Escribir "Ingrese el monto a ", operacion, ":"
                Leer monto
                
                Si operacion = "retirar" Entonces
                    Si saldo[i] >= monto Entonces
                        saldo[i] = saldo[i] - monto
                        Escribir "Retiro exitoso. Nuevo saldo: ", saldo[i]
                    SiNo
                        Escribir "Fondos insuficientes."
                    FinSi
                SiNo
                    saldo[i] = saldo[i] + monto
                    Escribir operacion, " exitoso. Nuevo saldo: ", saldo[i]
                FinSi
				
                cuentaEncontrada = 1
            SiNo
                Escribir "La cuenta está cerrada."
                cuentaEncontrada = 1
            FinSi
        FinSi
    FinPara
	
    Si cuentaEncontrada = 0 Entonces
        Escribir "Cuenta no encontrada."
    FinSi
FinFuncion

// Función para cambiar el estado de una cuenta
Funcion CambiarEstado(cuentas, cuenta, estado, nuevoEstado)
    Definir numCuenta Como Entero
    Definir encontrado Como Entero
    Escribir "Ingrese el número de cuenta:"
    Leer numCuenta
    encontrado = 0
    Para i = 0 Hasta cuentas - 1 Hacer
        Si cuenta[i] = numCuenta Entonces
            Si estado[i] = "ACTIVA" Entonces
                estado[i] = nuevoEstado
                Escribir "Cuenta ", nuevoEstado, " con éxito."
                encontrado = 1
            SiNo
                Escribir "La cuenta ya está ", nuevoEstado, "."
            FinSi
        FinSi
    FinPara
    Si encontrado = 0 Entonces
        Escribir "Cuenta no encontrada."
    FinSi
FinFuncion

// Función para actualizar los datos del cliente
Funcion ActualizarDatos(cuentas, cuenta, nombre, dni)
    Definir numCuenta Como Entero
    Definir encontrado Como Entero
    Escribir "Ingrese el número de cuenta:"
    Leer numCuenta
    encontrado = 0
    Para i = 0 Hasta cuentas - 1 Hacer
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
FinFuncion

// Función para consultar un cliente
Funcion ConsultarCliente(cuentas, cuenta, nombre, dni, saldo, estado)
    Definir numDni Como Cadena
    Definir i Como Entero
    Definir encontrado Como Entero
    Escribir "Ingrese su DNI:"
    Leer numDni
    encontrado = 0
    Para i = 0 Hasta cuentas - 1 Hacer
        Si dni[i] = numDni Entonces
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
FinFuncion

// Función para generar un reporte de cuentas
Funcion ReporteCuentas(cuentas, cuenta, nombre, saldo, estado)
    Escribir "===== REPORTE DE CUENTAS ====="
    Para i = 0 Hasta cuentas - 1 Hacer
        Escribir "Número de cuenta: ", cuenta[i]
        Escribir "Nombre del cliente: ", nombre[i]
        Escribir "Saldo: ", saldo[i]
        Escribir "Estado: ", estado[i]
        Escribir "----------------------------"
    FinPara
FinFuncion

// Función para mostrar estadísticas
Funcion Estadisticas(cuentas, saldo, estado)
    Definir totalSaldo Como Real
    Definir cuentasActivas, cuentasCerradas Como Entero
    totalSaldo = 0
    cuentasActivas = 0
    cuentasCerradas = 0
    Para i = 0 Hasta cuentas - 1 Hacer
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
FinFuncion
