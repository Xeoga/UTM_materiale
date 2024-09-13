
 my_list <- list(
   5,
   c(160, 180, 175),
   matrix(1:12, ncol = 3),
   data.frame(
     height = c(160, 180, 175),
     weight = c(52, 96, 60),
     age = c(18, 43, 29),
     c.eyes = c("green", "blue", "blue")
   )
 )

 names(my_list) <- c("element1", "element2", "element3", "element4")
 
 element_2_vector <- my_list[[2]]
 element_2_lista <- list(my_list[[2]])
 
 elemente_1_si_3 <- my_list[c("element1", "element3")]
 
 element_3_al_doua_coloana <- my_list[[4]][3, 2]
 
 print(my_list)
