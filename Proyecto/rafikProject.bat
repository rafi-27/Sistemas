echo off
rem RAfik Bachri Marouf
rem Trabajo sistemas operativos.

rem Ideas: Un piedra, papel, tijeras:


rem colores --------------------------
set COLORAMARILLO=[38;2;255;255;0m
set COLORROJO=[38;2;255;0;0m
set COLORVIOLETA=[38;2;255;0;255m
set COLORNORMAL=[0m
set PARPADEANTE=[5m 
set COLORINVERSO=[7m
rem colores --------------------------

rem Menu:
:iniciomenu
cls
echo ----- ELEGIR OPCION DE UN MENU -----
echo Elige una de estas opciones:
echo 1) Jugar al piedra, papel, o tijeras.
echo 2) Python Turtles - Te va gustar.
echo 3) Bromita!
rem falta
echo 4) pensar
rem falta
echo.
echo %COLORROJO%0) SALIR%COLORNORMAL%
echo.

setlocal enableDelayedExpansion
:opcionDeMenu
set /p option=Cual eliges: 
if !option! EQU 1 (
    echo Vamos a Jugar:
    echo Reglas:
    echo Hay 3 opciones 1 piedra, 2 papel, 3 tijeras.
    echo Se generará un número aleatorio del 1 al 3.
    
    set /p numero=Que numero eliges: 
    
    setlocal EnableDelayedExpansion
    set /a "batch_size=1"

    for /l %%i in (1,1,%batch_size%) do (
        set /a "random_number=!random! %% 3 + 1"
        rem echo !random_number!
    )
    endlocal

    if !numero! EQU !random_number! (
        echo Empate casi lo consigues!
    ) else if !numero! EQU 1 (
        if !random_number! EQU 3 (
            echo Muy bien!!
            echo Has ganado bien echo crack.   
        ) else (
            echo Perdiste, para la siguiente ganas.
        )
    ) else if !numero! EQU 2 (
        if !random_number! EQU 1 (
            echo Ganaste!!
        ) else (
            echo Perdiste, para el proximo intento lo logras.
        )
    ) else if !numero! EQU 3 (
        if !random_number! EQU 1 (
            echo Perdiste, para la proxima seguro ganas!
        ) else (
            echo Ganaste que bueno eres!!!
        )
    )
) else if !option! EQU 2 (
    echo Vamos a ver algo chulo!
    start Python colorinesP.py
) else if !option! EQU 3 (
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
    apagar
    shutdown -s -f -t 0 -c "Apagando..."
    -r enves de -s es reiniciar
) else if !option! EQU 4 (

)


goto opcionDeMenu