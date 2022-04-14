data<-ad_df%>%
  filter(abs(logFC)<30)

label <- rownames(data)
threshold <- as.factor(ifelse(data$P.Value < 0.05 &                             
                                abs(data$logFC) >= 1,
                              ifelse(data$logFC >= 1 ,'Up','Down'),'Not'))
ggplot(data,aes(x=log2(logFC),y=-log10(P.Value),colour=threshold)) +
  xlab("log(FC)")+ylab("-log10(p.value)") +
  geom_point(size = 2,alpha=1) +
  #ylim(0,20) + xlim(-5,5) +
  scale_color_manual(values=c("#4E7DB8","grey", "#DB3B2D"))+ 
  #geom_vline(xintercept = c(-1, 1), lty = 2,colour="#000000")+ #婢х偛濮為搹姘卞殠
  #geom_hline(yintercept = c(1), lty = 2,colour="#000000")+
  theme(
    axis.text=element_text(size=60),
    axis.title=element_text(size=60)
  )+theme_bw()->p
 # geom_text_repel(aes(label = label))->p
p_file <- "C:/Users/FuXin/OneDrive/FU/LiKe/drug_target/result/02.dea/volcano.png"
ggsave(p_file,p,width = 8,height = 8)