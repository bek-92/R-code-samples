# R Regression Diagnostics and Influential Observation Detection Sample
# Author: Bekhzodjon Rustamov
# Purpose:
# This script fits a multiple linear regression model and performs
# diagnostic checks for model specification, outliers, and influence.
#
# Skills demonstrated:
# - Linear regression in R
# - Model diagnostics using gvlma
# - Detection of leverage points using hat values
# - Detection of Y-outliers using studentized residuals
# - Influence analysis using DFBETAS and Cook's Distance

# Load data
ESI <- read.table("Assignment4_2026.dat", header = TRUE)

# Fit regression model
m1 <- lm(sales ~ age + income + education + tenure, data = ESI)

# Global validation of linear model assumptions
library(gvlma)
g1 <- gvlma(m1)
summary(g1)

# Identify X-outliers using hat values
h <- hatvalues(m1)
n <- nrow(ESI)
p <- length(coef(m1))
hat_cutoff <- 2 * (p / n)
x_outliers <- ESI$id[h > hat_cutoff]
x_outliers

# Identify Y-outliers using studentized residuals
rs <- rstudent(m1)
crit <- qt(1 - 0.10 / 2, df = n - p - 1)
y_outliers <- ESI$id[abs(rs) > crit]
y_outliers

# Identify observations influential on the intercept
dfb <- dfbetas(m1)
dfbeta_cutoff <- 2 / sqrt(n)
influential_intercept <- ESI$id[abs(dfb[, "(Intercept)"]) > dfbeta_cutoff]
influential_intercept

# Identify observations influential on age coefficient
influential_age <- ESI$id[abs(dfb[, "age"]) > dfbeta_cutoff]
influential_age

# Identify observations influential on income coefficient
influential_income <- ESI$id[abs(dfb[, "income"]) > dfbeta_cutoff]
influential_income

# Identify observations influential on education coefficient
influential_education <- ESI$id[abs(dfb[, "education"]) > dfbeta_cutoff]
influential_education

# Identify observations influential on tenure coefficient
influential_tenure <- ESI$id[abs(dfb[, "tenure"]) > dfbeta_cutoff]
influential_tenure

# Identify influential observations using Cook's Distance
cd <- as.data.frame(cooks.distance(m1))
cd$ID <- ESI$id
colnames(cd)[1] <- "CooksD"

cook_cutoff <- qf(0.50, p, nrow(cd) - p)
cd$warn <- ifelse(abs(cd$CooksD) > cook_cutoff, "Warn", "-")
cook_influential <- subset(cd, warn == "Warn")
cook_influential