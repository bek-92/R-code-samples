# R Logistic Regression Classification Sample
# Author: Bekhzodjon Rustamov
# Purpose:
# This script fits a logistic regression model to predict participation
# using age, then evaluates classification performance and ROC/AUC.
#
# Skills demonstrated:
# - Logistic regression in R
# - Odds ratio interpretation
# - Predicted probabilities and classification
# - Confusion matrix evaluation
# - False positive / false negative analysis
# - ROC and AUC analysis

# Load data
FlixIt <- read.table("FlixIt.txt", header = TRUE)

# Fit logistic regression model
FlixIt_logit <- glm(Partic ~ Age, data = FlixIt, family = binomial(link = "logit"))
summary(FlixIt_logit)

# McFadden's R-squared
library(pscl)
pR2(FlixIt_logit)

# Odds ratio for Age
odds_ratio_age <- exp(coef(FlixIt_logit)["Age"])
odds_ratio_age

# Predicted probabilities
FlixIt$PredProb <- predict(FlixIt_logit, type = "response")

# Classification at threshold = 0.5
cm <- table((FlixIt$PredProb > 0.5) + 0, FlixIt$Partic)
cm

# Total correct classification rate
tcc <- (cm[1,1] + cm[2,2]) / sum(cm)
tcc

# False negative rate
FN_rate <- cm[1,2] / (cm[1,2] + cm[2,2])
100 * FN_rate

# False positive rate
FP_rate <- cm[2,1] / (cm[1,1] + cm[2,1])
100 * FP_rate

# Incorrect classification rate among predicted participants
FP_rate_predicted <- cm[2,1] / (cm[2,1] + cm[2,2])
100 * FP_rate_predicted

# Incorrect classification rate among predicted non-participants
FN_rate_predicted <- cm[1,2] / (cm[1,1] + cm[1,2])
100 * FN_rate_predicted

# Odds of participation for a 30-year-old
odds30 <- exp(coef(FlixIt_logit)[1] + coef(FlixIt_logit)["Age"] * 30)
odds30

# Odds of participation for a 40-year-old
odds40 <- exp(coef(FlixIt_logit)[1] + coef(FlixIt_logit)["Age"] * 40)
odds40

# Relative odds: 40-year-old vs 30-year-old
odds40 / odds30

# Probability of participation for a 30-year-old
p30 <- odds30 / (1 + odds30)
p30

# ROC curve and AUC
library(pROC)
ROC_curve <- roc(Partic ~ Age, data = FlixIt)
plot(ROC_curve)
auc(ROC_curve)