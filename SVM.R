library(e1071)
data<-read.csv("C:/Users/paulm/Downloads/r programs/data.csv")
data$Class<-as.factor(data$Class)
train_index<-sample(1:nrow(data),0.8*nrow(data))
train<-data[train_index, ]
test<-data[-train_index, ]

print(train)

print(test)
model<-svm(Class~.,data=train,kernel='linear')
print(summary(model))

pred<-predict(model,test)

result<-data.frame(height=test$Height,
                   weight=test$Weight,
                   actual=test$Class,
                   pred=pred)
print(result)
plot(model,data)

plot(train$Height,train$Weight,col=train$Class,pch=19,xlab="height",ylab="weight",main="svm train and test")
points(test$Height,test$Weight,col="black",pch=8,cex=2)
legend("topleft",legend=c('class A','class B','test data'),col=c(1,2,'black'),pch=c(19,19,8))
