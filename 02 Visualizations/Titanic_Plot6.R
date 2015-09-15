require("ggplot2")
require("jsonlite")
df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select age, sex, pclass, parch, survived from titanic where not (age is null or sex is null or pclass is null or parch is null or survived is null) and age < 50 and age > 15"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_cjs2599', PASS='orcl_cjs2599', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

summary(df)
head(df)

ggplot() +
  coord_cartesian() +
  scale_x_discrete() +
  scale_y_discrete() +
  facet_grid(~PARCH~PCLASS, labeller=label_both) +
  labs(title="SURVIVAL AND FAMILY SIZE") +
  labs(x="SURVIVED", y=paste("SEX")) +
  layer(data=df,
        mapping=aes(x=as.character(SURVIVED), y=SEX, color=AGE),
        stat="identity",
        stat_params=list(),
        geom="point",
        geom_params=list(),
        position=position_jitter(width=0.3, height=0.3)
        )
