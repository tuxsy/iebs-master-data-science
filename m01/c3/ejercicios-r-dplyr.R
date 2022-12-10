# IEBS

## Ejercicios con dplyr

# -------------------------
# Carga el dataset Salaries.csv
df <- read.csv("Salaries.csv")

# -------------------------
# Importa dplyr y magrittr

library(dplyr)
library(magrittr)

# -------------------------
# Muestra las primeras filas del dataframe

head(df)
sample_n(df, 10)

# -------------------------
#  ¿Cual es la media del salario base, BasePay?

mean(df$BasePay, na.rm = T)

# -------------------------
# ¿Cuál es el mayor número de horas extra pagadas (OvertimePay)?

df %>% select(OvertimePay) %>% max( na.rm = T )
  
# -------------------------
# ¿Cual es el titulo del trabajo (JobTitle) del empleado JOSEPH DRISCOLL?

df[df$EmployeeName == "JOSEPH DRISCOLL", ] %>% select(JobTitle)

# -------------------------
# ¿Cuanto gana este empleado en total (TotalPayBenefits)?

df[df$EmployeeName == "JOSEPH DRISCOLL", ] %>% select(TotalPayBenefits)

# -------------------------
# ¿Cómo se llama la persona que más gana?

df %>%
  arrange(-BasePay) %>%
  head(1) %>%
  select(EmployeeName)

# -------------------------
# ¿Cual es la paga media por años?

df %>%
  group_by(Year) %>%
  summarise(mean_pay=mean(BasePay))

# -------------------------
# ¿Cuántos trabajos únicos hay?

df %>%
  select(JobTitle) %>%
  distinct() %>%
  nrow()

