#1
n = 3
p = 0.2
#1a
dgeom(n,p)
#1b
mean(rgeom(n = 10000, prob = p) == 3)

#1d
#install.packages("ggplot2")
#install.packages("dplyr")

library(dplyr)
library(ggplot2)

data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(Failures = ifelse(x == n, n, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Probabilitas X = 3 tidak hadir sebelum keberhasilan pertama",
       x = "Kegagalan sebelum keberhasilan pertama (x)",
       y = "Probabilitas") 

#1e
set_data <- rgeom(n = 10000, prob = p)
mean(set_data)
var(set_data)

#2
x = 4
size = 20
prob = 0.2

#2a
dbinom(x, size, prob)

#2b
x = seq(0, size, by = 1)
p = dbinom(x, size, prob)

plot(x,p,type='h')

#2c
set_data = rbinom(x, size, prob)

mean(set_data)
var(set_data)


#3 
lmbd = 4.5
#3a
dpois(6, lmbd)
#3b
library(dplyr)
library(ggplot2)

set.seed(2)

babies <- data.frame('data' = rpois(365, 4.5))

babies %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == 6),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Jumlah bayi per periode',
       y = 'Proporsi',
       title = 'n = 365 hari dengan lambda = 4.5') +
  theme_bw()

babies %>% dplyr::summarize(six_babies = sum(babies$data == 6) / n())
#3d
mean(rpois(365, 4.5))
var(rpois(365, 4.5))


#4
x = 2
v = 10
#4a
dchisq(x, v)
#4b
n = 100
set_data = rchisq(n, v)
hist(set_data, main = "Chi Square Histogram")
#4c
mean(set_data)
var(set_data)


#5
rate = 3
#5a
x_dexp <- seq(1, 10, by = 1)
dexp(x_dexp, rate)
#5b

N = 10
set_data <- rexp(N, rate = 3)
hist(set_data, main = "Histogram N = 10")
      
N = 100
set_data <- rexp(N, rate = 3)
hist(set_data, main = "Histogram N = 100")

N = 1000
set_data <- rexp(N, rate = 3)
hist(set_data, main = "Histogram N = 1,000")

N = 10000
set_data <- rexp(N, rate = 3)
hist(set_data, main = "Histogram N = 10,000")
#5c
set.seed(1) 
n = 100
x = 3
set_data <- rexp(n, rate)
mean(set_data)
var(set_data)

#6
n = 100
mean = 50
sd = 8
#6a
X1 = runif(1, max = mean)
X2 = runif(1, min = mean, max = 100)
x = runif(1, min = X1, max = X2)

set_data <- rnorm(n, mean, sd)

iter = seq(1, n, by = 1)
plot(iter, set_data, type = 'l')

dnorm(iter, mean, sd)

x.z <- (x - mean) / sd
x.z
#6b
hist(set_data, breaks = 50, main = "5025201102_Arya Nur_Probstat_C_DNhistogram
")
#6c
var(set_data)