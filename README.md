# breast_cancer_classification
Breast cancer classification on original Wiscnsin dataset using 10-fold Cross Validation.

## Language
Matlab

## Description / Goals
The purpose of this project is to develop a simpler and lighter version of the official Hugging face example [Fine-tuning a model on a question-answering task](https://github.com/huggingface/notebooks/blob/master/examples/question_answering.ipynb) where `distilbert-base-uncased` is trained on the SQuAD dataset.
In order to achieve that we use a smaller part of the [SQuAD 2.0 dataset](https://rajpurkar.github.io/SQuAD-explorer/) (86821 samples of the `train-v2.0.json` dataset and 10388 samples of the `dev-v2.0.json` dataset)  on which we fine-tune the `bert-base-uncased` model. 

## 10-fold Cross Validation Results

<p align="center">
<b>k-Nearest Neighbors</b>
</p>
| Method | Accuracy | Sensitivity | Specificity |	
| --- | :---: | :---: | :---: | 
|  |  |  |  |
|  |  |  |  |

<p align="center">
<b>Naive Bayes</b>
</p>
| Method | Accuracy | Sensitivity | Specificity |	
| --- | :---: | :---: | :---: | 
| Gaussian Distribution | 0.961373 | 0.951965 | 0.979253 |
| Kernel Smoothing Density | 0.964235 | 0.971616 | 0.950207 |

<p align="center">
<b>Support Vector Machines</b>
</p>
| Method | Accuracy | Sensitivity | Specificity |	
| --- | :---: | :---: | :---: | 
| Linear Kernel | 0.967096	| 0.971616 | 0.958506 |
| Gaussian kernel | 0.968526 | 0.967249 | 0.970954 |

<p align="center">
<b>Decision Trees</b>
</p>
| Method | Accuracy | Sensitivity | Specificity |	
| --- | :---: | :---: | :---: | 
| Exact Search | 0.949928 | 0.965066 | 	0.921162 |
| PCA Search | 0.938484 | 0.949782 | 0.917012 |

## Author
Vassilis Panagakis

## Date
June 2019
