# IEBS

## Ejercicios básicos de R

# -------------------------
# Cuanto es 7 a la cuarta?

7^4
  
# -------------------------
# Es este resultado divisible por 3?

(7^4 %% 3) == 0
  
# -------------------------
# Sabiendo que el radio de la Tierra es 6.371Km, imprime el mensaje: 
# "El perímetro de la Tierra es aproximadamente XXXX Km" 
# almacenando el resultado en la variable perimetro, calculando el valor de perimetro usando radio y pi.

pi
planeta <- 'Tierra'
radio <- 6371
perimetro <- 2 * pi * radio
paste("El perímetro de la", planeta, "es aproximadamente", perimetro, "Km")

# -------------------------
# Calcula el factorial de un numero, sabiendo que el factorial es la multiplicación 
# de ese número por todos los que le preceden

n <- 5

calcula_factorial <- function(x) {
  if (x == 1) {
    return(1)
  } else {
    return(x * calcula_factorial(x - 1))
  }
}
calcula_factorial(10)

# -------------------------
# Introduce la implementacion anterior de la funcion factorial dentro de una función 
# de modo que podamos llamar a `factorial(5)`

calcula_factorial(5)

# -------------------------
# Escribir una función que calcule si un numero n es primo, `es_primo(5)` 
# deberia devolver `TRUE` y `es_primo(4)` devolvería `FALSE`

es_primo <- function(x) {
  x <- abs(x)
  if (x == 0) {
    return(F)
  } else if (x <= 2) {
    return(T)
  } else {
    for (i in seq(2, x-1)) {
      if (x %% i == 0) {
        return(F)
      } 
    }
  return(T)
  }
}
  

for (n in seq(20)) {
  primo <- es_primo(n)
  print(paste(n, primo))
}
