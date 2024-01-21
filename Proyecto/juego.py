import random

def seleccionar_palabra():
    palabras = ["programacion", "sistemas", "batch", "desarrollo"]
    return random.choice(palabras)

def mostrar_palabra(palabra, letras_adivinadas):
    resultado = ""
    for letra in palabra:
        if letra in letras_adivinadas:
            resultado += letra
        else:
            resultado += "_"
    return resultado

def jugar_hangman():
    palabra_secreta = seleccionar_palabra()
    letras_adivinadas = []
    intentos_fallidos = []
    vidas = 6

    while vidas > 0:
        print("\nPalabra a adivinar:", mostrar_palabra(palabra_secreta, letras_adivinadas))
        print("Intentos fallidos:", intentos_fallidos)
        print("Vidas restantes:", vidas)

        letra = input("Ingresa una letra: ").lower()

        if letra in letras_adivinadas or letra in intentos_fallidos:
            print("Ya intentaste con esa letra. Intenta con otra.")
            continue

        if letra in palabra_secreta:
            letras_adivinadas.append(letra)
        else:
            intentos_fallidos.append(letra)
            vidas -= 1

        if set(letras_adivinadas) == set(palabra_secreta):
            print("\n¡Felicidades! Has adivinado la palabra:", palabra_secreta)
            break

    if vidas == 0:
        print("\n¡Oh no! Te has quedado sin vidas. La palabra era:", palabra_secreta)

if __name__ == "__main__":
    jugar_hangman()
