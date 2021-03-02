# breast_cancer_classification
Breast cancer classification on original Wisconsin dataset using 10-fold Cross Validation.

## Programming Language
Matlab

## Dataset
We use the [Breast Cancer Wisconsin (Original) Data Set](https://archive.ics.uci.edu/ml/datasets/breast+cancer+wisconsin+(original)) by UC Irvine Machine Learning Repository and more specifically the `breast-cancer-wisconsin.data` DATA file.

**Attribute Information:**
1. Sample code number: id number
2. Clump Thickness: 1 - 10
3. Uniformity of Cell Size: 1 - 10
4. Uniformity of Cell Shape: 1 - 10
5. Marginal Adhesion: 1 - 10
6. Single Epithelial Cell Size: 1 - 10
7. Bare Nuclei: 1 - 10
8. Bland Chromatin: 1 - 10
9. Normal Nucleoli: 1 - 10
10. Mitoses: 1 - 10
11. Class: (2 for benign, 4 for malignant)

**Data Preprocessing:**

We observe that the `Bare Nuclei` column has some fields completed with the `?` symbol, which represents an unknow value. In order to execute our Classification task we have to replace all the `?` of this column with a value in the range 1-10 to complete our dataset. We choose to replace all the `?` with `1` because it is the dominant value of the current column. As a result, the `Bare Nuclei` column is highly possible to have more occurancies of the value `1` than any other values in the range 1-10. <br>
The fixed dataset is uploaded in the current github repository.

## Classification Algorithms
* k-Nearest Neighbors
* Naive Bayes
* Support Vector Machines
* Decision Trees

## Description / Goals
The purpose of this project is the exploration of the most famous Classification Algorithms from the perspective of the Matlab programming language and check their efficiency on a simple yet significant task like the brest cancer classification. We execute each Classifier with different parametres and methods and we evaluate them using the **Accuracy**, **Sensitivity** and **Specificity** metrics, after applying 10-fold Cross Validation.

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
