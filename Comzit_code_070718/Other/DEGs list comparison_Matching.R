#fi_com <- "/media/reinbergShare/reinberglabspace/comzit/files_analysis_with_nico/EdgeR_analysis/csv_files/cBr_lrt_W_G.csv"

#up_nic <- "/home/descostes/Documents/analysis/comzit_ants/differential_analysis/results/edgeR/HSal85/brain/unfiltered/W_vs_G_brain/table_lrt_up_twofolds_signif.txt"
#down_nic <- "/home/descostes/Documents/analysis/comzit_ants/differential_analysis/results/edgeR/HSal85/brain/unfiltered/W_vs_G_brain/table_lrt_down_twofolds_signif.txt"

fi_com <-"/Volumes/Research/reinberglab/homes/co635/Deep\ sequencing/RNAseq/032818_W_G_RG/EdgeR_analysis/cBr_exact_W_G_TopTag_all_filteredLowCPM.csv"
fi_com <-"/Users/comzit/Desktop/cBr_exact_W_G_TopTag_all_filteredLowCPM1_rep2_041018.csv"
fi_com <-"/ifs/home/co635/RNAseq/cBr_exact_W_G_TopTag_Nico_featureCounts_042418.csv"
fi_com <-"/ifs/home/co635/RNAseq/cBr_exact_W_G_TopTag_Nico_featureCounts_NO_filtering_SKIPP_estCommonDisp_Taqwise_042418.csv"
fi_com <-"/ifs/home/co635/RNAseq/cBr_exact_W_G_TopTag_Nico_featureCounts_filtering_SKIPP_estCommonDisp_Taqwise_042418_lll.csv"
fi_exact_rep4_com <-"/Users/comzit/Downloads/cBr_exact_W_G_TopTag_all_filteredLowCPM1_rep4.csv"
fi_lrt_com <- "/Volumes/Research/reinberglab/homes/co635/Deep\ sequencing/RNAseq/032818_W_G_RG/EdgeR_analysis/csv_files/cBr_lrt_W_G.csv"
up_nic <- "/Users/comzit/Desktop/RNASEQ/EdgeR_brain_Hsal_v8.5/unfiltered/W_vs_G_brain/table_exact_up_twofolds_signif.txt"
down_nic <- "/Users/comzit/Desktop/RNASEQ/EdgeR_brain_Hsal_v8.5/unfiltered/W_vs_G_brain/table_exact_down_twofolds_signif.txt"


fi_com <- read.csv(fi_com)
dim(fi_com) #filtered list
[1] 13250     6
> dim(fi_com)# skip two dispersion functions
[1] 14630     6
fi_lrt_com <- read.csv(fi_lrt_com)
> > dim(fi_lrt_com)
[1] 20659    10
up_nic <- read.table(up_nic, stringsAsFactors = FALSE)
up_nic_sorted<- up_nic[order(up_nic[,"FDR"]), ]
down_nic <- read.table(down_nic, stringsAsFactors = FALSE)
down_nic_sorted<- down_nic[order(down_nic[,"FDR"]), ]
dim(up_nic)
[1] 68  4
dim(down_nic)
[1] 281   4
# Filtering com
up_2fold_com <- fi_com[which(fi_com[,"logFC"] >=1 & fi_com[,"PValue"] < 0.05),]
#pavlues cut off are different from the decdieTestDGE
up_2fold_com <- fi_com[which(fi_com[,"logFC"] >=1 & fi_com[,"FDR"] < 0.05),]
dim(up_2fold_com)
[1] 368   6 #414   6
[1] 347   6 #CPM >1 rep=4
[1] 383   6 # skip two dispersion functions
[1] 412   6 # NIco_featureCounts_parameters
[1] 382   6 # NIco_featureCounts_parameters_SkippTwo_EST_dispersion
[1] 382   6 # NIco_featureCounts_parameters_SkippTwo_EST_dispersion_NoFiltering

up_2fold_com_sorted<- up_2fold_com[order(up_2fold_com[,"FDR"]), ]
down_2fold_com  <- fi_com[which(fi_com[,"logFC"] <= 1 & fi_com[,"FDR"] < 0.05),]
down_2fold_com_sorted<- down_2fold_com[order(down_2fold_com[,"FDR"]), ]
dim(down_2fold_com)
[1] 253   6
[1] 197   6 # CPM >1 Rep=4
[1] 255   6 # skip two dispersion functions
[1] 257   6 # NIco_featureCounts_parameters
[1] 253   6 # NIco_featureCounts_parameters_SkippTwo_EST_dispersion
[1] 253   6 # NIco_featureCounts_parameters_SkippTwo_EST_dispersion_Nofiltering



Nic_geneNames=rownames(up_nic)
Com_geneNames=as.character(up_2fold_com[,2])
length(which(Nic_geneNames == Com_geneNames))
which(down_nic[,1] %in% down_2fold_com[,2])

length(which(down_nic[,1] == down_2fold_com[,2]))

seq(length(com))[com %in% nic]

up_2fold_com_sorted[which(up_2fold_com_sorted$genes=="HSALG011990.2"),]
resultsMatched=up_nic_sorted[rownames(up_nic_sorted) %in% down_2fold_com_sorted$genes,]
# 8 False + 60 True
dim(resultsMatched)
[1] 60  4
resultsMatched=down_nic_sorted[rownames(down_nic_sorted) %in% up_2fold_com_sorted$genes,]
# 8 False + 255 True out of 281 
dim(resultsMatched)
[1] 255   4
[1] 276   4 #CPM>1 rep=4


x1=as.vector(up_2fold_com_sorted$gene)
y1=rownames(down_nic_sorted)
length(x1)=length(y)
x1y1=cbind(x1,y1)
> length(seq(length(x1))[x1 %in% y1])
[1] 276
