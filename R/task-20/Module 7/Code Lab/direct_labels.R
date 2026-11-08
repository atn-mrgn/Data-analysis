library(tidyverse)
library(readxl)
library(janitor)

cases <- read_excel("WHO/reported-cases--2020.xlsx") %>% clean_names()


# one of the labels is cut-off to the right
cases %>%
  filter(disease == "YFEVER", 
         code %in% c("PER", "LBR", "BOL", "GHA"), year <= 1995) %>%
  complete(year = full_seq(year, 1), 
           nesting(group, code, name), disease, disease_description) %>% 
  mutate(cases = replace_na(cases, 0))  %>% 
  ggplot(aes(x=year, y=cases, color=name)) +
  geom_line(size=1) + 
  geom_text(aes(label=name), 
            data = . %>% filter(year == 1995),
            hjust=0,
            nudge_x = .3,
            size=3, 
            nudge_y=c(10, 0, 0, 0)) +
  coord_cartesian(clip="off") +
  labs(title="Yellow Fever Cases",
       x=NULL, y="Cases",
       color="Country") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.margin = margin(r=1, unit="cm"))


# fix it
cases %>%
  filter(disease == "YFEVER", 
         code %in% c("PER", "LBR", "BOL", "GHA"), year <= 1995) %>%
  complete(year = full_seq(year, 1), 
           nesting(group, code, name), disease, disease_description) %>% 
  mutate(cases = replace_na(cases, 0))  %>% 
  ggplot(aes(x=year, y=cases, color=name)) +
  geom_line(size=1) + 
  geom_text(aes(label=name), 
            data = . %>% filter(year == 1995),
            hjust=0,
            nudge_x = .3,
            size=3, 
            nudge_y=c(10, 0, 0, 0)) +
  scale_x_continuous(expand=c(0, 0)) + # optional: reduce spacing on ends
  coord_cartesian(clip="off", 
                  xlim=c(1980, 1995)) + # keep grid from extending 
  labs(title="Yellow Fever Cases",
       x=NULL, y="Cases",
       color="Country") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.margin = margin(r=4.5, unit="cm"))  # increase the right margin




