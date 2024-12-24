library(ggplot2)
library(dplyr)
library(gapminder)

gapminder
df = gapminder
view(df)
head(df)
tail(df)
str(df)
glimpse(df)
dim(df)

# scatterplot 
# ggplot(data, aes(x,y)) +
#     geom_point()

# add colour by continent
ggplot(df, aes(x = lifeExp, y = pop, color = continent)) +
  geom_point()

# add shape and colour by continent
ggplot(df, aes(x = lifeExp, y = pop, color = continent, shape = continent)) +
  geom_point()

# change y scale
ggplot(df, aes(x = lifeExp, y = pop, color = continent, shape = continent)) +
  geom_point() + 
  scale_y_log10()

# add title
ggplot(df, aes(x = lifeExp, y = pop, color = continent, shape = continent)) +
  geom_point() + 
  scale_y_log10() + 
  ggtitle("Population Versus Life Expectancy Graph") +
  xlab("Life expectancy") =
  ylab("Population")

# Add black & white theme to the graph
ggplot(df, aes(x = lifeExp, y = pop, color = continent, shape = continent)) +
  geom_point() + 
  scale_y_log10() + 
  ggtitle("Population Versus Life Expectancy Graph") +
  xlab("Life expectancy") +
  ylab("Population") +
  theme_bw();

# line plot
malaysia_df <- df %>%
  filter(country == "Malaysia")
head(malaysia_df)

ggplot(malaysia_df, aes(x = year, y = lifeExp)) +
  geom_line()

# box plot
ggplot(df, aes(x = lifeExp)) +
  geom_boxplot()

# violin plot
ggplot(df, aes(x = pop, y= lifeExp)) +
  geom_violin()

# histogram
ggplot(df, aes(x = lifeExp)) +
  geom_histogram()

# histogram (bins value higher, information more detailed)
ggplot(df, aes(x = lifeExp)) +
  geom_histogram(bins = 20)

ggplot(df, aes(x = lifeExp)) +
  geom_histogram(bins = 30)

ggplot(df, aes(x = lifeExp)) +
  geom_histogram(bins = 50)

ggplot(df, aes(x = lifeExp)) +
  geom_histogram(binwidth = 10)

ggplot(df, aes(x = lifeExp)) +
  geom_histogram(binwidth = 20)

ggplot(df, aes(x = lifeExp)) +
  geom_histogram(binwidth = 30)

#data camp (more references)

#geom_bar etc... make investigation.


