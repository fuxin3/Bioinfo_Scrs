df_dimplot <- function(rds){
    DimPlot(rds,
        reduction = "umap",
        group.by = "celltype_anno",
        cols = cell_colors
        label =TRUE)+
        Nolegend()
}