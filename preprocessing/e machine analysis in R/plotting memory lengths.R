ml <- read.csv('times.csv', header = TRUE)

plot(ml$time, x = ml$ï..memory, main = 'time taken for each ml')

plot(ml$complexity, x = ml$ï..memory, main = 'statistical complexity for each ml')

