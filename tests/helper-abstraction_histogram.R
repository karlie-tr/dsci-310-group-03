library(readr)
library(ggplot2)
library(dplyr)

cleveland <- read_delim("../data/raw/heart_disease_data.csv", 
                        col_names = c('age','sex','chest_pain_type','resting_bp','cholesterol','high_blood_sugar','resting_ecg',
                                      'max_heart_rate','exercise_pain','old_peak','slope','no_vessels_colored','thal',
                                      'diagnosis','diagnosis_2'),
                        delim = ",",
                        show_col_types = FALSE,
                        na = "?")

cleveland <- cleveland |>
  mutate(no_vessels_colored = as.numeric(no_vessels_colored),
         high_blood_sugar = sub('TRUE', 'true',high_blood_sugar),    # replace 'fal' with FALSE for readability
         exercise_pain = sub('TRUE', 'true',exercise_pain),          
         diagnosis = sub('buff','healthy', diagnosis)) |>           # replace 'buff' with 'healthy' for readability
  mutate_if(is.character, as.factor)   

cleveland_select <- select(cleveland, -diagnosis_2)

cholesterol_histogram_ggplot <- ggplot(cleveland_select, aes(x = cholesterol, fill = diagnosis)) +
  geom_histogram(position="dodge") +
  labs(x = "Serum Cholesterol (mg/dl)", y="Percentage of Observations", fill = "Diagnosis")+
  theme(text = element_text(size = 10)) +
  scale_fill_brewer(palette = "Paired")

age_histogram_ggplot <- ggplot(cleveland_select, aes(x = age, fill = diagnosis)) +
  geom_histogram(position="dodge") +
  labs(x = "Age", y="Percentage of Observations", fill = "Diagnosis")+
  theme(text = element_text(size = 10))+
  scale_fill_brewer(palette = "Paired")


