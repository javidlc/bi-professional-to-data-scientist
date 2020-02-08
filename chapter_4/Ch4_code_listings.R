#######################
#Chapter 4
#######################


wb_pop_sa_all <- read.csv(file = "wb_pop_surface_area.csv")
str(wb_pop_sa_all)


#install readr
install.packages("readr")
#load readr
library(readr)
#Read file into a dataframe
wb_pop_sa_all <- read_csv(file = "wb_pop_surface_area.csv")
str(wb_pop_sa_all)


library(dplyr)
select(wb_pop_sa_all,country, region,surface_area)


filter(select(wb_pop_sa_all,country, region), is.na(region))


print(filter(select(wb_pop_sa_all,country, region), is.na(region)),n=46)


wb_pop_sa <- filter(wb_pop_sa_all, !is.na(region))


unique(select(wb_pop_sa, region))


filter(select(wb_pop_sa, region, country), region=='South Asia')


filter(select(wb_pop_sa, region, country), region=='South Asia' | region=='North America')


arrange(filter(select(wb_pop_sa, region, country), 
                 region=='South Asia' | region=='North America'), 
          region, country)


arrange(filter(select(wb_pop_sa, region, country), 
               region %in% c('South Asia', 'North America')), 
        region)


arrange(filter(select(wb_pop_sa, region, country), 
               region=='South Asia' | region=='North America'), 
        desc(region), desc(country))


arrange(filter(select(wb_pop_sa, region, country),
               !region=='South Asia' | region=='North America'), 
        region, country)


filter(select(wb_pop_sa, region, country, surface_area), 
       surface_area<1000)


filter(select(wb_pop_sa, region, country, surface_area), 
         surface_area<1000, region=='East Asia & Pacific')


arrange(filter(select(wb_pop_sa, region, country), 
               region %in% c('South Asia', 'North America')), 
        region)


wb_pop_sa %>% 
  select(region, country) %>% 
  filter(region=='South Asia' | region=='North America') %>% 
  arrange(region)


wb_pop_sa %>% 
  select(country, males_2014, females_2014, surface_area) %>% 
  filter((males_2014+females_2014)>3e8)


wb_pop_sa %>% 
  select(country, males_2014, females_2014, surface_area) %>% 
  filter((males_2014+females_2014)/surface_area>1000) 
 

wb_pop_sa %>% 
  select(country, males_2014, females_2014, surface_area) %>% 
  filter((males_2014+females_2014)/surface_area>1000) %>% 
  mutate(pop_density_2014=(males_2014+females_2014)/surface_area)


wb_pop_sa %>% 
  summarise(total_males_2014 = sum(males_2014), 
            total_females_2014 = sum(females_2014))


wb_pop_sa <- wb_pop_sa %>% filter(!(is.na(males_2014) |
                                      is.na(females_2014) | 
                                      is.na(males_1974) | 
                                      is.na(females_1974) | 
                                      is.na(surface_area)))


wb_pop_sa %>% 
  summarise(total_males_2014 = sum(males_2014), 
            total_females_2014 = sum(females_2014))


wb_pop_sa %>% 
  select(region, males_2014, females_2014) %>%  
  group_by(region) %>% 
  summarise(total_males_2014 = sum(males_2014), 
            total_females_2014 = sum(females_2014), 
            num_countries=n())


library(tidyr)
wb_pop_sa %>% 
  select(country, region, males_2014, females_2014, 
         males_1974,females_1974) %>% 
  gather(key="type",value="population", 
         males_2014, females_2014, males_1974, females_1974)


wb_pop_sa %>% 
  select(country, region, males_2014, females_2014, 
         males_1974,females_1974) %>% 
  gather(key="type",value="population", 
         males_2014, females_2014, males_1974, females_1974) %>% 
  separate(col="type", into = c("gender", "year"), sep = "_")


co2_emissions <- read_csv(file="wb_CO2_emissions_kt.csv")


wb_pop_sa %>% 
  inner_join(co2_emissions,by="country")


library(ggplot2)
#specify data layer
p <- ggplot(data= wb_pop_sa)
#display plot
p


p <- ggplot(data= wb_pop_sa, aes(x=region)) +
  geom_bar()+ #A
  labs(x="Region", y="Number of Countries") #B
p
#A - geometry function specifying bar plot
#B - Axis labels.


library(forcats)
p <- ggplot(data= wb_pop_sa, aes(x=fct_infreq(region))) + #A
  geom_bar() +
  labs(x="Region", y="Number of Countries") +
  theme(axis.text.x=element_text(angle=45, hjust=1)) #B
p


p <- ggplot(data= wb_pop_sa, aes(x=fct_rev(fct_infreq(region)), 
                                 fill=income_group)) + #A
  geom_bar()+
  labs(x="Region", y="Number of Countries", fill="Income Group")+ #B
  theme(axis.text.x=element_text(angle=45, hjust=1))
p
#A - display income group breakdown per region by fill colour.
#B - label the legend appropriately.


#order by inc male pop
p <- ggplot(data= filter(wb_pop_sa, 
                         region=='Middle East & North Africa'), #A 
            aes(x=reorder(country, males_2014), y=males_2014)) + #B 
    geom_bar(stat = 'identity') + #C 
  labs(x="Country", y="Male Population (2014)")+ 
  theme(axis.text.x=element_text(angle=45, hjust=1))
p


wb_pop_sa_tidy <- 
  wb_pop_sa %>% 
  gather(key="type",value="population", 
         males_2014, females_2014, males_1974, females_1974) %>% 
  separate(col="type",into = c("gender", "year"), sep = "_")



#plot male and female pops side by side
p <- ggplot(data= filter(wb_pop_sa_tidy,
                         region=='Middle East & North Africa'),
            aes(x=reorder(country, population),y=population, fill=gender)) +
  geom_bar(stat = 'identity', position="dodge")+ #A
  labs(x="Country", y=" Population (2014)")+
  theme(axis.text.x=element_text(angle=45, hjust=1))
p
#A - plot the two bars side-by-side instead of stacking them.


wb_pop_sa_co2 <- wb_pop_sa %>% 
  inner_join(co2_emissions, by="country")
names(wb_pop_sa_co2)


wb_pop_sa_co2 <- wb_pop_sa_co2 %>% 
  select(everything()) %>% 
  filter(!(is.na(emissions_2014) | 
             is.na(emissions_1974)))
nrow(wb_pop_sa_co2)


wb_pop_sa_co2 <- wb_pop_sa_co2 %>% 
  select(everything()) %>% 
  mutate(population_2014=(males_2014+females_2014), 
         population_1974=(males_1974+females_1974))


p <- ggplot(data=wb_pop_sa_co2) + 
  geom_point(mapping = aes(x=population_2014,y=emissions_2014)) + #A
  labs(x="Population (2014)", y=" CO2 Emissions (2014)")
p


p <- ggplot(data=wb_pop_sa_co2) + 
  geom_point(mapping = aes(x=population_2014,y=emissions_2014)) + 
  geom_text(data=subset(wb_pop_sa_co2, population_2014 > 3e8 | 
                          emissions_2014 > 2e6), #A 
            aes(x=population_2014,y=emissions_2014,label=country), 
            nudge_y=1e6) + #B 
  labs(x="Population (2014)", y=" CO2 Emissions (2014)")
p 
#A - multiple filters on the dataset.
#B - shifts the labels up so that they don't obscure the point.


p <- ggplot(data=wb_pop_sa_co2) + 
  geom_point(mapping = aes(x=population_2014,y=emissions_2014)) + 
  coord_cartesian(xlim=c(0,2.6e8),ylim=c(0,1.25e6))+ #A 
  labs(x="Population (2014)", y=" CO2 Emissions (2014)")
p
#A - set lower and upper display limits on x and y axes.


p <- ggplot(data=wb_pop_sa_co2) + 
  geom_point(mapping = aes(x=population_2014,y=emissions_2014, 
                           colour=region)) + #A 
  coord_cartesian(xlim=c(0,2.6e8),ylim=c(0,1.25e6)) + 
  labs(x="Population (2014)", y=" CO2 Emissions (2014)")
p
#A - distinguish region by colour.


p <- ggplot(data=wb_pop_sa_co2) + 
  geom_point(mapping = aes(x=population_2014,y=emissions_2014, 
                           colour=income_group)) + #A 
  coord_cartesian(xlim=c(0,2.6e8),ylim=c(0,1.25e6)) + 
  labs(x="Population (2014)", y=" CO2 Emissions (2014)")
p
#A - distinguish income group by colour.



