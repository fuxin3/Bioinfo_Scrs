#limma
library(edgeR)

group <- reg_exp_1$cell_reg

design <- model.matrix(~group)

fit <- lmFit(exp_dd, design)
fit <- eBayes(fit, trend=TRUE)
res<- topTable(fit, coef=ncol(design),sort.by = "P", n = Inf)