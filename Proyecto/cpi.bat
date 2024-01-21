@echo off
rem RAfik Bachri Marouf
rem Trabajo sistemas operativos.

rem colores --------------------------
set COLORAMARILLO=[38;2;255;255;0m
set COLORROJO=[38;2;255;0;0m
set COLORVIOLETA=[38;2;255;0;255m
set COLORNORMAL=[0m
set PARPADEANTE=[5m 
set COLORINVERSO=[7m
rem colores --------------------------

:iniciomenu
cls
echo %COLORAMARILLO% Empezamos!!%COLORNORMAL%
type foton.ans
echo ----- ELEGIR OPCION DE UN MENU -----
echo Elige una de estas opciones:
echo 1) Jugar al piedra, papel, o tijeras.
echo 2) Python Turtles - Te va gustar.
echo 3) Bromita!
echo 4) Juego de ahorcado sobre informatica. Dos opciones en batch o python.

echo.
echo %COLORROJO%0) SALIR%COLORNORMAL%
echo.

setlocal enableDelayedExpansion

:opcionDeMenu
set /p option=Cual eliges: 

if !option! EQU 1 (
    call :opcion1
) else if !option! EQU 2 (
    call :opcion2
) else if !option! EQU 3 (
    call :opcion3
) else if !option! EQU 4 (
    call :opcion4
) else if !option! EQU 0 (
    exit
) else (
    echo Opción no válida. Inténtalo de nuevo.
    goto opcionDeMenu
)

goto opcionDeMenu

:opcion1
echo Vamos a Jugar:
echo Reglas:
echo Hay 3 opciones 1 piedra, 2 papel, 3 tijeras.
echo Se generara un numero aleatorio del 1 al 3.

set /p numero=Que numero eliges: 

setlocal EnableDelayedExpansion
set /a "batch_size=1"

for /l %%i in (1,1,%batch_size%) do (
    set /a "random_number=!random! %% 3 + 1"
)

if !numero! EQU !random_number! (
    type empate.ans
) else if !numero! EQU 1 (
    echo.
    type puno.ans
    echo.
    if !random_number! EQU 3 (
        echo.
        type vs.ans
        echo.
        type tijeras.ans
        echo.
        type ganar.ans   
    ) else (
        echo.
        type vs.ans
        echo.
        type tijeras.ans
        echo.
        type perder.ans
    )
) else if !numero! EQU 2 (
    echo.
    type papel.ans
    echo.
    type vs.ans
    echo.
    if !random_number! EQU 1 (
        echo.
        type puno.ans
        echo.
        type ganar.ans
    ) else (
        echo.
        type puno.ans
        echo.
        type perder.ans
    )
) else if !numero! EQU 3 (
    echo.
    type tijeras.ans
    echo.
    type vs.ans
    if !random_number! EQU 1 (
        echo.
        type puno.ans
        echo.
        type perder.ans
    ) else (
        echo.
        type puno.ans
        echo.
        type ganar.ans
    )
)
echo.
pause
endlocal
goto iniciomenu

:opcion2
echo Vamos a ver algo chulo!
start Python colorinesP.py
pause
goto iniciomenu

:opcion3
echo Uy!
title Formatear disco duro
echo ¿Desea formatear su disco duro? (y/n)
pause >nul
echo Analizando...
echo.
pause
cls
dir /s
dir /s
dir /s
echo.
echo.
pause
cls
echo %COLORROJO%Borrando archivos...%COLORNORMAL%
echo.
pause
cls
echo Archivos borrados
echo.
pause
cls
echo Presione una tecla para reiniciar.
echo.
pause >nul
msg * Esto es una broma, no te asustes =P
exit
pause
goto iniciomenu

:opcion4
rem Implementar lógica para la opción 4 aquí
set /p opcionSeleccionada=Cual quieres 1 bacth 2 python: 
if !opcionSeleccionada! EQU 1 (
    setlocal EnableDelayedExpansion

rem Palabras para el juego
set Palabras[0]=RAM
set Palabras[1]=programacion
set Palabras[2]=hangman
set Palabras[3]=batch
set Palabras[4]=Sistemas

rem Seleccionar una palabra al azar
set /a "Indice=!random! %% 5"
set PalabraSecreta=!Palabras[%Indice%]!

rem Inicializar variables
set "PalabraAdivinada="
set "IntentosFallidos="
set "Vidas=6"

:Juego
cls
echo.
echo Palabra a adivinar: !PalabraAdivinada!
echo Intentos fallidos: !IntentosFallidos!
echo Vidas restantes: !Vidas!

rem Obtener la letra del jugador
set "Letra="
set /p "Letra=Ingresa una letra: "

rem Verificar si la letra ya ha sido intentada
if defined IntentosFallidos (
    echo !IntentosFallidos! | find /i "!Letra!" >nul
    if not errorlevel 1 (
        echo Ya intentaste con esa letra. Intenta con otra.
        timeout /nobreak /t 2 >nul
        goto Juego
    )
)

rem Verificar si la letra está en la palabra
set "Acierto="
for /l %%i in (0, 1, 10) do (
    set "LetraPalabra=!PalabraSecreta:~%%i,1!"
    if /i "!Letra!"=="!LetraPalabra!" (
        set "Acierto=true"
        set "PalabraAdivinada=!PalabraAdivinada!!Letra!"
    ) else (
        set "PalabraAdivinada=!PalabraAdivinada!_"
    )
)

rem Actualizar intentos fallidos si no hay acierto
if not defined Acierto (
    set "IntentosFallidos=!IntentosFallidos!!Letra! "
    set /a "Vidas-=1"
)

rem Verificar si el jugador ganó o perdió
if "!PalabraAdivinada!"=="!PalabraSecreta!" (
    cls
    echo ¡Felicidades! Has adivinado la palabra: !PalabraSecreta!
    goto FinJuego
)

if !Vidas! leq 0 (
    cls
    echo ¡Oh no! Te has quedado sin vidas. La palabra era: !PalabraSecreta!
    goto FinJuego
)

rem Continuar el juego
goto Juego

:FinJuego
echo.
echo Juego terminado.
pause >nul
exit /b
) else if !opcionSeleccionada! EQU 2 (
    start juego.py
)
pause
goto iniciomenu