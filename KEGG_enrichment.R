library(clusterProfiler)

#species human
library(org.Hs.eg.db)

KEGG_enrich <- function(genelist){

    eg <- bitr(genelist, 
           fromType="SYMBOL", 
           toType=c("ENTREZID","ENSEMBL",'SYMBOL'),
           OrgDb="org.Hs.eg.db")
    
    kegg <- enrichKEGG(eg$ENTREZID, 
                   organism = 'hsa',
                   keyType = 'kegg', 
                   pvalueCutoff = 0.05,
                   pAdjustMethod = 'BH', 
                   minGSSize = 3,
                   maxGSSize = 500,
                   qvalueCutoff = 0.05,
                   use_internal_data = FALSE)

    kegg <- setReadable(kegg, OrgDb = org.Hs.eg.db, keyType="ENTREZID")
    return(kegg)
}

write.table(kegg,,filename = "", sep=",")

barplot(kegg,showCategory=30,orderBy = "p.adjust")
dotplot(kegg,showCategory=25,orderBy = "p.adjust")->p

ggsave(filename = "",
       plot = p,
       width = 9,height = 6)