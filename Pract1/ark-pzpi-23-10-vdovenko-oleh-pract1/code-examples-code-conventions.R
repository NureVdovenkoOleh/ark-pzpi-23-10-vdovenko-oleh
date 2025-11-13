# В.1 Модульна структура коду

# Погано (монолітний скрипт)
data <- read.csv("file.csv")
summary(data)
plot(data)
# ... ще 200 рядків у одному файлі

# Добре (модульний підхід)
source("data_load.R")
source("analysis.R")
source("visualization.R")

# В.2 Форматування умовних конструкцій

# Погано
if(x>0){print("positive")}else{print("negative")}

# Добре
if (x > 0) {
  print("positive")
} else {
  print("negative")
}

# В.3 Приклад неінформативних назв

# Погано
a <- 10
f <- function(x) x * 2

# В.4 Змістовне іменування змінних та функцій

# Добре
customer_age <- 10
multiply_by_two <- function(number) number * 2

# В.5 Використання «магічних чисел»

# Погано
price <- 100
discount_price <- price * 0.85 

# В.6 Використання констант для ясності

# Добре
DISCOUNT_RATE <- 0.15
price <- 100
discount_price <- price * (1 - DISCOUNT_RATE)

# В.7 Надлишкові коментарі

# Погано
x <- 5
x <- x + 1  # додаємо 1
y <- 10
y <- y * 2  # множимо на 2

# В.8 Змістовні коментарі, що пояснюють логіку

# Добре
x <- 5
# Корекція даних: зміщуємо всі значення на одиницю
x <- x + 1

y <- 10
# Масштабування показників для нормалізації
y <- y * 2

# В.9 Функція без документації

# Погано
f <- function(x, y){
  x + y
}
# Що робить ця функція? Невідомо

# В.10 Документування функції за допомогою roxygen2

#' Добре
#' Обчислює суму двох чисел
#' @param x перше число
#' @param y друге число
#' @return сума чисел
#' @examples
#' add_numbers(2, 3)
add_numbers <- function(x, y) {
  x + y
}

# В.11 Вразлива функція без обробки помилок

# Погано
divide <- function(a, b) {
  a / b
}
# Якщо b = 0, програма просто падає

# В.12 Обробка помилок з stop() та tryCatch()

# Добре
safe_divide <- function(a, b) {
  if (b == 0) stop("Помилка: ділення на нуль!")
  a / b
}

# Використання tryCatch для обробки
result <- tryCatch(
  safe_divide(10, 0),
  error = function(e) { message("Сталася помилка: ", e$message); NA }
)

# В.13 Функція без модульних тестів

# Погано
square <- function(x) {
  x^2
}
# Ніяких тестів немає, помилки можуть залишитися непоміченими

# В.14 Модульне тестування з пакетом testthat

# Добре
library(testthat)

square <- function(x) {
  x^2
}

test_that("square працює правильно", {
  expect_equal(square(2), 4)
  expect_equal(square(-3), 9)
  expect_equal(square(0), 0)
})

# В.15 Порушення стандартів стилю

# Погано
myfunc<-function(x){x+1}
y=  2+3

# В.16 Код, відформатований відповідно до стилю

# Добре
my_func <- function(x) {
  x + 1
}
y <- 2 + 3

# В.17 Поганий код: все разом і без пояснень

# Погано
f<-function(a,b){c=a+b;d=c/2;print(d)}
x=10;y=20;f(x,y)

# В.18 Хороший код: структурований та документований

#' Добре
#' Обчислює середнє двох чисел і виводить його
#' @param a перше число
#' @param b друге число
#' @return середнє значення
mean_two_numbers <- function(a, b) {
  result <- (a + b) / 2
  print(result)
}

x <- 10
y <- 20
mean_two_numbers(x, y)

print("Усі приклади виконано успішно!")