# breast_cancer_classification
Breast cancer classification on original Wisconsin dataset using 10-fold Cross Validation.

## Language
Matlab

## Description / Goals
The purpose of this project is to develop a simpler and lighter version of the official Hugging face example [Fine-tuning a model on a question-answering task](https://github.com/huggingface/notebooks/blob/master/examples/question_answering.ipynb) where `distilbert-base-uncased` is trained on the SQuAD dataset.
In order to achieve that we use a smaller part of the [SQuAD 2.0 dataset](https://rajpurkar.github.io/SQuAD-explorer/) (86821 samples of the `train-v2.0.json` dataset and 10388 samples of the `dev-v2.0.json` dataset)  on which we fine-tune the `bert-base-uncased` model. 

## 10-fold Cross Validation Results

### k-Nearest Neighbors
| Method | Accuracy | Sensitivity | Specificity |	
| --- | :---: | :---: | :---: | 
| 5-Nearest Neighbors | 0.964235 | 0.971616 | 0.950207 |
| 10-Nearest Neighbors | 0.969957 | 0.978166 | 0.954357 |
| 100-Nearest Neighbors | 0.952790 | 0.980349 |0.900415 | 

### Naive Bayes
| Method | Accuracy | Sensitivity | Specificity |	
| --- | :---: | :---: | :---: | 
| Gaussian Distribution | 0.961373 | 0.951965 | 0.979253 |
| Kernel Smoothing Density | 0.964235 | 0.971616 | 0.950207 |

### Support Vector Machines
| Method | Accuracy | Sensitivity | Specificity |	
| --- | :---: | :---: | :---: | 
| Linear Kernel | 0.967096	| 0.971616 | 0.958506 |
| Gaussian kernel | 0.968526 | 0.967249 | 0.970954 |

### Decision Trees
| Method | Accuracy | Sensitivity | Specificity |	
| --- | :---: | :---: | :---: | 
| Exact Search | 0.949928 | 0.965066 | 	0.921162 |
| PCA Search | 0.938484 | 0.949782 | 0.917012 |

## Author
Vassilis Panagakis

## Date
June 2019
