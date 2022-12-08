# IEBS

## Ejercicios básicos de R

# -------------------------
# Cuanto es 7 a la cuarta?

7^4

# -------------------------
# Es este resultado divisible por 3?

res <- 7^4
res %% 3 == 0

# -------------------------
# Sabiendo que el radio de la Tierra es 6.371Km, imprime el mensaje: 
# "El perímetro de la Tierra es aproximadamente XXXX Km" 
# almacenando el resultado en la variable perimetro, calculando el valor de perimetro usando radio y pi.

pi
planeta <- 'Tierra'
radio <- 6371

perimetro <- 2 * pi * radio
print(paste("El perímetro de la", planeta, "es aproximadamente", perimetro, "Km"))


# -------------------------
# Calcula el factorial de un numero, sabiendo que el factorial es la multiplicación 
# de ese número por todos los que le preceden

n <- 5
resultado <- 1
i <- 2
while (i <= n) {
  resultado <- resultado * i
  i <- i + 1
}

resultado

# -------------------------
# Introduce la implementacion anterior de la funcion factorial dentro de una función 
# de modo que podamos llamar a `factorial(5)`

factorial <- function(n) {
  resultado <- 1
  i <- 2
  while (i <= n) {
    resultado <- resultado * i
    i <- i + 1
  }
  resultado
}

factorial(5)

# -------------------------
# Escribir una función que calcule si un numero n es primo, `es_primo(5)` 
# deberia devolver `TRUE` y `es_primo(4)` devolvería `FALSE`

es_primo <- function(n) {
  primo = TRUE
  i <- 2
  while (i <= n / 2 + 1) {
    if (n %% i == 0) {
      primo = FALSE
    }
    i <- i + 1
  }
  primo
}

es_primo(5)

es_primo(4)
