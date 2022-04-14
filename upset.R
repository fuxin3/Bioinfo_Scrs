library(UpSetR)

upset(iso_dist_bool, nsets = 18, nintersects = 30, mb.ratio = c(0.5, 0.5),
      order.by = c("freq", "degree"), decreasing = c(TRUE,FALSE))