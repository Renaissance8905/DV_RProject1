df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from titanic"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_cjs2599', PASS='orcl_cjs2599', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))


ggplot() +
  coord_cartesian() +
  scale_x_discrete() +
  scale_y_discrete() +
  #facet_grid((SIBSP+PARCH)~SURVIVED, labeller=label_both) +
  labs(title="Survival Rate and Family Size") +
  labs(x="FAMILY SIZE", y=paste("SURVIVED")) +
  layer(data=df,
        mapping=aes(x=(as.numeric(as.character(SIBSP))+as.numeric(as.character(PARCH))), y=as.numeric(as.character(SURVIVED)), color=SEX), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )
