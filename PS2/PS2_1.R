library(tidyr)
library(dplyr)
library(ggplot2)
#1.1
Earthquake <- read.csv(file = "signif.csv" , header = T)
Sig_Eqs <- as_tibble(Earthquake)

#1.2
DeathsPerCountry <- Sig_Eqs %>% 
                      select(COUNTRY,DEATHS) %>% 
                      group_by(COUNTRY) %>% 
                      summarise(ToltalDeaths <- sum(DEATHS,na.rm = T))

DeathsPerCountry1 <- DeathsPerCountry %>% 
                      arrange(desc(`ToltalDeaths <- sum(DEATHS, na.rm = T)`))
print(
  head(DeathsPerCountry1,10)
  )

#1.3
EQsPeryear <- Sig_Eqs %>% 
                select(YEAR,EQ_PRIMARY) %>% 
                filter(EQ_PRIMARY > 6.0) %>% 
                mutate(COUNT = 1) %>% 
                group_by(YEAR) %>% 
                summarise(NUMofEQs <- sum(COUNT,na.rm = T))
EQsPeryear %>% 
  ggplot(aes(x=YEAR,y=`NUMofEQs <- sum(COUNT, na.rm = T)`))+
  geom_line()

#1.4
CountEq_LargestEq <-function(Input){
  
CountEq <- Sig_Eqs %>% 
            filter(COUNTRY == Input)%>% 
            count()
    
LargestEq <- Sig_Eqs %>% 
              select(YEAR,MONTH,DAY,HOUR,MINUTE,SECOND,EQ_PRIMARY,COUNTRY) %>% 
              filter(COUNTRY == Input)%>% 
              arrange(desc(EQ_PRIMARY)) %>% 
              head(1)

LargestEq %>% 
  mutate(COUNTEQ = CountEq)
  
}
Country <- unique(Earthquake$COUNTRY)
SUMMARY <- CountEq_LargestEq(Country[1])

for(i in Country){
  SUMMARY <- union(SUMMARY,CountEq_LargestEq(i))
}

print(SUMMARY %>% 
        arrange(desc(COUNTEQ)))
