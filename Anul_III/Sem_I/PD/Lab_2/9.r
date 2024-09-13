person <- data.frame(
   height = c(160, 180, 175),
   weight = c(52, 96, 60),
   age = c(18, 43, 29),
   c.eyes = c("green", "blue", "blue")
 )

colnames(person)[3] <- "new.age"
rownames(person)[2] <- "Mary"
rownames(person) <- NULL
colnames(person) <- c("a", "b", "c", "d")
element_1_3 <- person[1, 3]
variabila_2_df <- person[, "b"]
variabila_2_vector <- person[["b"]]
elemente_1_si_3_age <- person[c(1, 3), "c"]
height_160_superioare <- person$height[person$height > 160]
height_180_inferioare <- person$height[person$height < 180]
greutate_inalta <- person$weight[person$height > 170]
persoane_greutate_mai_mare <- person[person$weight > 52, ]
person[1:2, "a"] <- c(190, 158)

