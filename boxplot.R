library(ggplot)
library(ggsignif)

#input
#gdf, colnames: variable-goups, value, 

df_boxplot <- function(gdf){
    ggplot(gdf,aes(x= variable, y =value,fill = variable))+
    geom_boxplot(width=0.5)+
    geom_point(alpha = 0.5)+
    geom_line(aes(group=mirna), col="grey")+
    ggtitle(label = "Cas9-miRNAs")+
    geom_signif(comparisons = list(c("Increase","Decrease")),  #add significance
                map_signif_level=function(p)sprintf("p = %.2g", p))+
    #geom_signif(comparisons = list(c("Increase","Decrease")),
    #            map_signif_level=TRUE)+
    ylab("CellType Number")+xlab("")+
    scale_fill_manual(values = c("#FF6666","#0099CC"))+ #
    theme_bw()+
    theme(legend.position = "none")
}