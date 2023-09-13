# Session 3: Data types and functions

names_daltons <- c("Joe", "William", "Jack", "Averell")
height_daltons <- c(120.5, 150.4, 170.3, 190.0)
crimes_daltons <- c(136L, 10L, 10L, 5L) 
smart_daltons <- c(TRUE, TRUE, TRUE, FALSE)

typeof(names_daltons)
class(names_daltons)

is.character(names_daltons)
is.logical(smart_daltons)
is.double(height_daltons)
is.integer(height_daltons)
is.numeric(height_daltons)

names_daltons[3]
names_daltons[2:4] 		
names_daltons[c(1, 4)]
index <- height_daltons > 125
names_daltons[index]

a <- c(TRUE, "hello", 1)
typeof(a)

height_daltons + c(10, 10, 10, 10)
height_daltons + 10
height_daltons + c(10, 10)

daltons_list <- list(names_daltons, height_daltons)
daltons_list2 <- list(daltons_list, crimes_daltons)

daltons_list[2]
daltons_list[1:2]

daltons_list[[2]]

robberies_daltons <- matrix(data = c(2, 4, 5, 3), 
                            ncol = 2, nrow = 2, byrow = T)

robberies_daltons[1, 2]
robberies_daltons[2, ]
robberies_daltons[, 1]


daltons_df <- data.frame(height = height_daltons, 
                         names = names_daltons)

daltons_df[, 1]
daltons_df$height

danger_daltons <- factor(c("deadly","dangerous",
                           "dangerous","harmless"),
                         levels = c("deadly","dangerous","harmless"))

is.numeric(msleep$name)		
is.numeric(msleep$genus) 			
is.numeric(msleep$sleep_total)
mean(msleep$sleep_total)
is.numeric(msleep$bodywt)
mean(msleep$bodywt) 

rock_below <- FALSE
if (!rock_below) {
  coyote_falls <- TRUE
} else {
  coyote_falls <- FALSE
}

a <- c(1, 2, 4, 1)
b <- c(2, 1, 5, 1)
a + b

library(carData) 
titanic_survival <- as_tibble(TitanicSurvival)
mean(titanic_survival$age, na.rm = TRUE)

lapply(msleep, function(x) 
  if (is.numeric(x)) mean(x, na.rm = TRUE) else NULL)

cube_root <- function(x) {
  result <- x^(1/3)
  return(result)
}

cube_root(1000)	
cube_root(-1000)
cube_root("Busta Rhymes")

cube_root <- function(x) {
  if (!is.numeric(x)) stop("x must be a number")
  result <- ifelse(x >= 0, x^(1/3), -(-x)^(1/3))
  return(result)
}

debug(cube_root)
cube_root("Busta Rhymes") 
undebug(cube_root)
