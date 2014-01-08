library(glmnet)
M<-read.csv("/work/02265/viswam78/RScripts/Artificial/FluxDataThresholdNoTransportNitrogen1a.csv",header=F)
#######
M[abs(M)<0.000001]=0
######
sizeM=dim(M)
######Sizes#######
## 100/2=50 ## 100/4=25 ## 100/10=10 ## 100/20=5 ## 100/25=4
#################
## Training set depends on size needed.
FactorReplicates=2
trainend=ceiling(sizeM[1]/FactorReplicates)

## Test set is always bottom half
teststart=ceiling(sizeM[1]/2)+1
testend=sizeM[1]
testdataSize=testend-trainend
## NO Scaling and Centering: Not a good idea to scale here, as it screws up C/N sources
#M<-scale(M,center=TRUE,scale=FALSE)
Mtrain<-M[1:trainend,]
Mtrainyy1<-Mtrain[,1443]
Mtrainyy2<-Mtrain[,1444]
Mtrainyy12<-Mtrain[,1445]
Mtrainxx<-Mtrain[,1:1442]
##Mtrainxx<-scale(Mtrainxx,center=TRUE,scale=FALSE)
##Mtrainxx<-Mtrainxx[,]

Mtest<-M[teststart:testend,]
Mtestyy1<-Mtest[,1443]
Mtestyy2<-Mtest[,1444]
Mtestyy12<-Mtest[,1445]
Mtestxx<-Mtest[,1:1442]
#M<-scale(M,center=TRUE,scale=FALSE)
##Mtestxx<-scale(Mtestxx,center=TRUE,scale=FALSE)
##Mtestxx<-Mtestxx[,]

sizetest=dim(Mtest)
testsize<-sizetest[1]
#Myy12<-Myy1*7 + Myy2 - 7
#table(Mtrainyy1)
#table(Mtrainyy2)
#table(Mtrainyy12)

#lam<-c(exp(seq(log(0.01),log(1e-8),len=201)))

#GLMnet_modelC0<-cv.glmnet(as.matrix(Mxx),as.factor(Myy1),family="multinomial",alpha=0.0,standardize=FALSE,maxit=500000,type.measure="class",nfolds=10)

#GLMnet_modelN0<-cv.glmnet(as.matrix(Mxx),as.factor(Myy2),family="multinomial",alpha=0.0,standardize=FALSE,maxit=500000,type.measure="class",nfolds=10)
#GLMnet_modelCN<-glmnet(as.matrix(Mxx),as.factor(Myy1),family="multinomial",alpha=1.0,standardize=FALSE,maxit=100000,thresh=0.00001)
#lam<-c(0.07,0.067,0.063,0.061,0.058,0.055,0.053,0.05,0.0483,0.046,0.044,0.042,0.0401,0.0382,0.0365,0.0348,0.0333,0.0318,0.0303,0.0289,0.0276,0.0263,0.0252,0.024,0.023,0.022,0.021,0.02,0.019,0.018,0.017,0.016,0.015,0.0144,0.0137,0.0131,0.0125,0.0119,0.0114,0.011,0.0104,0.0099,0.00948,0.00905,0.00866,0.00825,0.00787,0.00751,0.00717,0.00684,0.00653,0.00624,0.00595,0.00568,0.00542,0.00518,0.00494,0.0048,0.0047,0.0046,0.0045,0.0044,0.0043,0.0042,0.0041,0.004,0.0039,0.0038,0.0037,0.0036,0.0035,0.0034,0.0033,0.0032,0.0031,0.003,0.0029,0.0028,0.0027,0.0026,0.0025,0.0024,0.0023,0.0022,0.0021)
#GLMnet_modelCN1<-glmnet(as.matrix(Mxx),as.factor(Myy12),family="multinomial",alpha=1.0,standardize=FALSE)
###########################
#GLMnet_modelCN<-glmnet(as.matrix(Mtrainxx),as.factor(Mtrainyy12),family="multinomial",alpha=1.0,standardize=FALSE,maxit=900000,lambda.min.ratio=0.002)

cvGLMnet_modelCN<-cv.glmnet(as.matrix(Mtrainxx),as.factor(Mtrainyy12),family="multinomial",alpha=0.9,standardize=TRUE,maxit=900000,type.measure="class",nfolds=3,lambda.min.ratio=0.002,nlambda=1000)

#id<-which(cvGLMnet_modelCN1$lambda==cvGLMnet_modelCN1$lambda.min)yy
#id
lassoCN<-as.vector(coef(cvGLMnet_modelCN,s=cvGLMnet_modelCN$lambda.min))
lassoCN

cvGLMnet_modelCN$lambda
cvGLMnet_modelCN$lambda.min
cvGLMnet_modelCN$lambda.1se
cvGLMnet_modelCN$cvm
predCN<-predict(cvGLMnet_modelCN,newx=as.matrix(Mtestxx),type='class',s=cvGLMnet_modelCN$lambda.min)
predCNLevels<-factor(as.numeric(paste(predCN)),levels=c(1:49))
tableCN<-table("Predicted"=predCNLevels,"Actual Value"=as.factor(Mtestyy12))
#predCN
tableCN
MisclassificationCN<-testsize-sum(diag(tableCN))
MisclassificationCN
###########################
###########################
#GLMnet_modelC<-glmnet(as.matrix(Mtrainxx),as.factor(Mtrainyy1),family="multinomial",alpha=0.9,standardize=FALSE,maxit=9000000,lambda.min.ratio=0.0002,nlambda=1000)

cvGLMnet_modelC<-cv.glmnet(as.matrix(Mtrainxx),as.factor(Mtrainyy1),family="multinomial",alpha=0.9,standardize=TRUE,maxit=9000000,type.measure="class",nfolds=3,lambda.min.ratio=0.002,nlambda=1000)

#id<-which(cvGLMnet_modelCN1$lambda==cvGLMnet_modelCN1$lambda.min)
#id
lassoC<-as.vector(coef(cvGLMnet_modelC,s=cvGLMnet_modelC$lambda.min))
lassoC

cvGLMnet_modelC$lambda
cvGLMnet_modelC$lambda.min
cvGLMnet_modelC$lambda.1se
cvGLMnet_modelC$cvm
predC<-predict(cvGLMnet_modelC,newx=as.matrix(Mtestxx),type='class',s=cvGLMnet_modelC$lambda.min)
tableC<-table("Predicted"=as.numeric(predC),"Actual Value"=as.factor(Mtestyy1))
#predC
tableC
MisclassificationC<-testsize-sum(diag(tableC))
MisclassificationC

###########################
#GLMnet_modelN<-glmnet(as.matrix(Mtrainxx),as.factor(Mtrainyy2),family="multinomial",alpha=0.9,standardize=FALSE,maxit=9000000,lambda.min.ratio=0.0002,nlambda=1000)

cvGLMnet_modelN<-cv.glmnet(as.matrix(Mtrainxx),as.factor(Mtrainyy2),family="multinomial",alpha=0.9,standardize=TRUE,maxit=9000000,type.measure="class",nfolds=3,lambda.min.ratio=0.002,nlambda=1000)

#id<-which(cvGLMnet_modelCN1$lambda==cvGLMnet_modelCN1$lambda.min)
#id
lassoN<-as.vector(coef(cvGLMnet_modelN,s=cvGLMnet_modelN$lambda.min))
lassoN
#sum(abs(GLMnet_modelCN1$glmnet.fit$beta[,id])>1e-15)
#sum(abs(GLMnet_modelCN1$glmnet.fit$beta[,id])>1e-5)
#sum(abs(GLMnet_modelCN1$glmnet.fit$beta[,id])>1e-3)
#sum(abs(GLMnet_modelCN1$glmnet.fit$beta[,id])>1e-1)

cvGLMnet_modelN$lambda
cvGLMnet_modelN$lambda.min
cvGLMnet_modelN$lambda.1se
cvGLMnet_modelN$cvm
predN<-predict(cvGLMnet_modelN,newx=as.matrix(Mtestxx),type='class',s=cvGLMnet_modelN$lambda.min)
tableN<-table("Predicted"=as.numeric(predN),"Actual Value"=as.factor(Mtestyy2))
#predN
tableN
MisclassificationN<-testsize-sum(diag(tableN))
MisclassificationN

#####################################
#####################################
#predCLevels<-factor(as.numeric(paste(predC)),levels=c(1:7))
#dim(predCLevels)
#predNLevels<-factor(as.numeric(paste(predN)),levels=c(1:7))
#dim(predNLevels)
#predJointCNLevels<-(predCLevels*7)+predNLevels-7
predJointCNLevels<-7*(as.numeric(paste(predC)))+(as.numeric(paste(predN)))-7
predJointCNLevelsORIG<-7*(as.numeric(paste(Mtestyy1)))+(as.numeric(paste(Mtestyy2)))-7
predJointCNLevels<-factor(predJointCNLevels,levels=c(1:49))
predJointCNLevelsORIG<-factor(predJointCNLevelsORIG,levels=c(1:49))
tablejointCN<-table("Predicted"=predJointCNLevels,"Actual"=predJointCNLevelsORIG)
MisclassificationJointCN<-testsize-sum(diag(tablejointCN))
MisclassificationJointCN
tablejointCN

#save(GLMnet_modelC0, file="GLMnet_C0.saved")
#save(GLMnet_modelN0, file="GLMnet_N0.saved")
#save(GLMnet_modelCN1_100Repsmaxit9e6, file="GLMnet_CN1_100Repsmaxit9e6.saved")

#pdf(file="/home1/02265/viswam78/RScripts/C0.pdf")
#plot(GLMnet_modelC0)
#plot(GLMnet_modelC$lambda)
#plot(GLMnet_modelC$cvm)
#plot(GLMnet_modelC$cvsd)
#dev.off()

MisclassificationCN/testdataSize
MisclassificationC/testdataSize
MisclassificationN/testdataSize
MisclassificationJointCN/testdataSize

write.table(predC,"/work/02265/viswam78/RScripts/Artificial/predC_Carbon.txt")
write.table(predN,"/work/02265/viswam78/RScripts/Artificial/predN_Carbon.txt")
write.table(predCN,"/work/02265/viswam78/RScripts/Artificial/predCN_Carbon.txt")

write.table(cvGLMnet_modelC$cvm,"/work/02265/viswam78/RScripts/Artificial/cvm_Carbon.txt")
ClassificationRates<-c(MisclassificationCN/testdataSize,MisclassificationC/testdataSize,MisclassificationN/testdataSize,MisclassificationJointCN/testdataSize)
pdf(file="/work/02265/viswam78/RScripts/Artificial/Noise1ReplicateCarbon1.pdf")
plot(cvGLMnet_modelC$cvm)
dev.off()
