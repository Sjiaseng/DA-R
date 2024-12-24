dfdata = read.csv("C:\\Users\\user\\Desktop\\Rstudio\\Electric_Vehicle_Population_Data.csv")

library("dplyr")
dfdata = unique(dfdata)
nrow(dfdata)

dfdata = dfdata[complete.cases(dfdata),]
nrow(dfdata)

#question1 
city = unique(dfdata$City)
city_count = length(city)
city_count

#question2
filter1 = dfdata %>% filter(dfdata$Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility == "Clean Alternative Fuel Vehicle Eligible")

mydata = filter1 %>% summarise(mymodel = unique(Model))

mydata

#question3
filter1 = dfdata %>% filter(dfdata$Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility != "Clean Alternative Fuel Vehicle Eligible")

head(filter1$Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility, 1)

#question4
models = dfdata %>% filter(dfdata$Clean.Alternative.Fuel.Vehicle..CAFV..Eligibility == "Clean Alternative Fuel Vehicle Eligible") %>%
  select(Make, Model, Model.Year)

models = unique(models)
models = models %>% arrange(Model.Year, Make, Model)
models %>% slice_head(n=1)
head(models,1)

rm(models)
               
#question5
city = dfdata %>% group_by(City) %>% summarise(count = n()) %>% arrange(desc(count))
head(city,3)

#question6
install.packages("ggplot2")

library(ggplot2)

yearlygrowth = dfdata %>% group_by(Model.Year) %>% 
  summarise(count = n()) 
print(yearlygrowth,n=25)

?ggplot
ggplot(data=yearlygrowth, aes(x=Model.Year, y=count)) +
  geom_line(linewidth=1) + geom_point()
