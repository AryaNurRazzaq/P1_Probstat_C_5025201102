# P1_Probstat_C_5025201102
## Soal 1
Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.
### 1.a
Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi 
sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik)
> dengan nilai x = 3 dan p = 0.2 bisa kita gunakan fungsi `dgeom()` untuk mencari peluangnya
 ```sh
n = 3
p = 0.20
#
dgeom(n,p)
```
### 1.b
mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )
> dengan n = 10000, prob = 0.2 dan X = 3 digunakan fungsi `mean()`
```sh
mean(rgeom(n = 10000, prob = p) == 3)
```

### 1.c
Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
> dari percobaan a didapat hasil a = 0.1024 dan b = 0.1012. Dapat ditarik kesimpulan bahwa besar peluang A sama dengan nilai mean

### 1.d
Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama
> Untuk membuat histogram ini dapat diinstal terlebih dahulu package `ggplot2` dan `dplyr`
```sh
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
  ```
  ### 1.e
  Nilai Rataan (μ) dan Varian (σ2) dari Distribusi Geometrik.
  > Untuk soal ini dapat dibuat terlebih dahulu `set_data` untuk menyimpan hasil random data dan untuk mencari mean digunakan `mean()` dan untuk varian menggunakan `var()`
```sh
set_data <- rgeom(n = 10000, prob = p)
mean(set_data)
var(set_data)
```
## Soal 2
Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2
### 2.a
Peluang terdapat 4 pasien yang sembuh.
> Untuk menghitung peluang dengan x = 4, size = 20, dan prob = 0.2 digunakan fungsi `dbinom()`
```sh
x = 4
size = 20
prob = 0.2

dbinom(x, size, prob)
```
### 2.b
Gambarkan grafik histogram berdasarkan kasus tersebut.
> Untuk menggambar grafik dapat digunakan fungsi `plot()` dengan `type = 'h'` sebagai penanda histogram
```sh
x = seq(0, size, by = 1)
p = dbinom(x, size, prob)

plot(x,p,type='h')
```
### 2.c
Nilai Rataan (μ) dan Varian (σ2) dari Distribusi Binomial.
> Untuk soal ini untuk mencari mean digunakan `mean()` dan untuk varian menggunakan `var()`
```sh
set_data = rbinom(x, size, prob)

mean(set_data)
var(set_data)
```
## Soal 3
Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis
4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
### 3.a
Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
> untuk peluang distribusi poisson menggunakan fungsi `dpois()`
```sh
lmbd = 4.5
dpois(6, lmbd)
```
### 3.b
simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama
setahun (n = 365)
> untuk membuat histogram menggunakan fungsi
```sh
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
  labs(x = 'Number of babies born per period',
       y = 'Proportion',
       title = '365 simulated births in a hospital with Pois(lambda = 4.5)') +
  theme_bw()

babies %>% dplyr::summarize(six_babies = sum(babies$data > 6) / n())
```
### 3.c
dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
> Dari percobaan yang dilakukan didapatkan hasil yang kurang lebih sama yaitu  0.1281201 dan 0.1150685

### 3.d
Nilai Rataan (μ) dan Varian (σ2) dari Distribusi Poisson.
> Untuk mencari rataan digunakan `mean()` dan untuk varian menggunakan `var()`
```sh
mean(rpois(365, 4.5))
var(rpois(365, 4.5))
```
## Soal 4
Diketahui nilai x = 2 dan v = 10
### 4.a
Fungsi Probabilitas dari Distribusi Chi-Square
> Fungsi probabilitas untuk distribusi chi square menggunakan `dchisq()`
```sh
x = 2
v = 10

dchisq(x, v)
```
### 4.b 
Histogram dari Distribusi Chi-Square dengan 100 data random
> Untuk histogram Chi-Square menggunakan 
```sh
n = 100
set_data = rchisq(n, v)
hist(set_data, main = "Chi Square Histogram")
```
### 4.c 
Nilai Rataan (μ) dan Varian (σ2) dari Distribusi Chi-Square.
> Untuk mencari rataan digunakan `mean()` dan untuk varian menggunakan `var()`
```sh
mean(set_data)
var(set_data)
```
## Soal 5
Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3).
### 5.a
Fungsi Probabilitas dari Distribusi Exponensial
> Untuk Distribusi Exponensial digunakan `dexp` dengan interval 1 hingga 10
```sh
rate = 3

x_dexp <- seq(1, 10, by = 1)
dexp(x_dexp, x)
```
### 5.b
Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
> Akan dibuat 4 histogram dengan fungsi `hist()`
```sh
N = 10
set_data <- rexp(N, rate = 3)
hist(set_data, main = "Histogram N = 10")
      
N = 100
set_data <- rexp(N, rate = 3)
hist(y_rexp, main = "Histogram N = 100")
       
N = 1000
set_data <- rexp(N, rate = 3)
hist(y_rexp, main = "Histogram N = 1,000")

N = 10000
set_data <- rexp(N, rate = 3)
hist(y_rexp, main = "Histogram N = 10,000")
```
### 5.c
Nilai Rataan (μ) dan Varian (σ2) dari Distribusi Exponensial untuk n = 100 dan λ = 3
● Gunakan set.seed(1)
● Gunakan fungsi bawaan R
> dengan mengikuti perintah dari soal kita gunakan `set.seed(1)`
```sh
set.seed(1) 
n = 100
x = 3
set_data <- rexp(n, rate)
mean(set_data)
var(set_data)
```




