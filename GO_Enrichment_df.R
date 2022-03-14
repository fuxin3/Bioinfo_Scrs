library(ggplot2)
library(tidyverse)

ggplot(data, aes(x = GO_biological_process, y = Fold_enrichment)) + 
#geom_hline(yintercept = 1, linetype="dashed",
#color = "azure4", size=.5)+
geom_point(data = data, aes(x=GO_biological_process, y=Fold_enrichment,size = Gene_number, color = '|log10 (FDR)|'), alpha=.7)+
scale_x_discrete(limits= data$GO_biological_process)+
scale_color_gradient(low = "green", high = "red", limits=c(0, NA))+
coord_flip()+
theme_bw()+
theme(axis.ticks.length=unit(-0.1, "cm"),
    axis.text.x = element_text(margin=margin(5,5,0,5,"pt")),
    axis.text.y = element_text(margin=margin(5,5,5,5,"pt")),
    axis.text = element_text(color = "black"),
    panel.grid.minor = element_blank(),
legend.title.align = 0.5)+ 
xlab("GO biological processes")+ 
ylab("Fold enrichment") + 
labs(color="log10(FDR)", size="Number\nof genes")