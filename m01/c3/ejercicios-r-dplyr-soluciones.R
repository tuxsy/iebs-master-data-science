# IEBS

## Ejercicios con dplyr

# -------------------------
# Carga el dataset Salaries.csv

df <- read.csv("Salaries.csv")

# -------------------------
# Importa dplyr y magrittr

library(magrittr)
library(dplyr)

# -------------------------
# Muestra las primeras filas del dataframe

head(df)

# -------------------------
#  ¿Cual es la media del salario base, BasePay?

mean(df$BasePay, na.rm=TRUE)

# -------------------------
# ¿Cuál es el mayor número de horas extra pagadas (OvertimePay)?

max(df$OvertimePay, na.rm=TRUE)

# -------------------------
# ¿Cual es el titulo del trabajo (JobTitle) del empleado JOSEPH DRISCOLL?

df %>% filter(EmployeeName == "JOSEPH DRISCOLL") %>% select(JobTitle)

# -------------------------
# ¿Cuanto gana este empleado en total (TotalPayBenefits)?

df %>% filter(EmployeeName == "JOSEPH DRISCOLL") %>% select(TotalPayBenefits)

# -------------------------
# ¿Cómo se llama la persona que más gana?

max_salary = max(df$BasePay, na.rm=TRUE)
df %>% filter(BasePay == max_salary) %>% select(EmployeeName)

# -------------------------
# ¿Cual es la paga media por años?

df %>% group_by(Year) %>% summarise(mean_pay = mean(BasePay, na.rm=TRUE))

# -------------------------
# ¿Cuántos trabajos únicos hay?

df %>% select(JobTitle) %>% distinct() %>% nrow()

