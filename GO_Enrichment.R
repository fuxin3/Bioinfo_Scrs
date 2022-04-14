library(clusterProfiler)

#species homan
library(org.Hs.eg.db)

#input
#genelist

GO_enrich <- function(genelist){

    eg <- bitr(genelist, 
           fromType="SYMBOL", 
           toType=c("ENTREZID","ENSEMBL",'SYMBOL'),
           OrgDb="org.Hs.eg.db")

    go <- enrichGO(eg$ENTREZID, 
               OrgDb = org.Hs.eg.db, 
               ont='ALL',
               pAdjustMethod = 'BH',
               pvalueCutoff = 0.05, 
               qvalueCutoff = 0.05,
               keyType = 'ENTREZID',
               readable = TRUE)

    return(go)
    
}

write.table(go,,filename = "", sep=",")

barplot(go,showCategory=30,orderBy = "p.adjust")
dotplot(go,showCategory=25,orderBy = "p.adjust")->p

ggsave(filename = "",
       plot = p,
       width = 9,height = 6)