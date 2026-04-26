# Code Samples

This repository contains selected R and Python code samples adapted from graduate coursework to demonstrate quantitative analysis, statistical modeling, diagnostic testing, machine learning evaluation, and reproducible analytical workflows.

## Files

### 1. `R_regression_diagnostics_outlier_detection_sample.R`
This script fits a multiple linear regression model and performs diagnostic checks, including:
- global model validation
- leverage-based outlier detection
- studentized residual analysis
- DFBETAS influence checks
- Cook's Distance review

### 2. `R_logistic_regression_classification_sample.R`
This script fits a logistic regression model and evaluates classification performance, including:
- model estimation
- odds ratio interpretation
- confusion matrix analysis
- false positive and false negative rates
- ROC curve and AUC
### 3. `Python_membership_inference_model_evaluation_sample.py`
This script demonstrates a Python-based membership inference workflow using shadow models and a meta-classifier. It compares privacy leakage risk across two target classifiers using confidence scores and ROC/AUC analysis.

### 4. `Python_fairness_baseline_subgroup_metrics_sample.py`
This script demonstrates a baseline fairness-style evaluation workflow in Python. It fits a classification model, computes overall performance, and compares subgroup metrics such as accuracy, AUC, log loss, and positive prediction rates across demographic groups.

### 5. `Python_pgd_evasion_audit_sample.py`
This script demonstrates a robustness audit for a binary classifier under projected gradient descent (PGD) style adversarial perturbations. It evaluates how accuracy, AUC, and prediction stability degrade as perturbation strength increases.

## Note
These samples were adapted from individual graduate coursework and cleaned for portfolio presentation. They are shared to demonstrate coding style, statistical reasoning, and reproducible analysis in R and Python.
