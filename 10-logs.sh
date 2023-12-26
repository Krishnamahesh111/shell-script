#!/bin/bash

ID=(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE=/tmt/"$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "ERROR:: $2 ... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access"
    exit 1
else
    echo "You are root user"
fi

yum install Mysql -y &>> $LOGFILE

VALIDATE $? "Installing MySql"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT" 