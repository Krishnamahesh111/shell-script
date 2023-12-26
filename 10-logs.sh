#!/bin/bash

ID=(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE=/tmt/"$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2 ... FAILED"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

if [ $ID -ne 0]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
else
    echo "You are root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MySql"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT" 