library(survival)
library(survminer)

#input
#df, A data.frame including clinical and group information

fun_sur <- function(df){
    fit <- survfit(Surv(Time, Status) ~ Var, #group factor: sex
               data = df)
    ggsurvplot(fit,
           pval = TRUE, 
           conf.int = TRUE,
           risk.table = TRUE, # Add risk table
           risk.table.col = "Var", # Change risk table color by groups
           linetype = "Var", # Change line type by groups
           surv.median.line = "hv", # Specify median survival
           ggtheme = theme_bw(), # Change ggplot2 theme
           palette = c("#E7B800", "#2E9FDF")
}
