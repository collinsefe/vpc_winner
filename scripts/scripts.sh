echo "Checking S3 bucket exists....."
BUCKET_NAME=tf-state-dev001
REGION=eu-west-1
S3_CHECK=$(aws s3 ls "s3://${BUCKET_NAME}" 2>&1)   

if [ $? != 0 ]                                                                                                                                                                                                                                
then                                                                                                                                                                                                                                          
  NO_BUCKET_CHECK=$(echo $S3_CHECK | grep -c 'NoSuchBucket')                                                                                                                                                                                     
  if [ $NO_BUCKET_CHECK = 1 ]; then                                                                                                                                                                                                              
    echo "Bucket does not exist .. I will create the bucket"                                                                                                                                                                                                              
    echo "Creating the bucket...."
    echo $BUCKET_NAME 'will be created in' $REGION 
    aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION  --create-bucket-configuration LocationConstraint=$REGION                                                                                                                                                                                                                    
  else                                                                                                                                                                                                                                        
    echo "Error checking S3 Bucket"                                                                                                                                                                                                           
    echo "$S3_CHECK"                                                                                                                                                                                                                          
    exit 1                                                                                                                                                                                                                                    
  fi 
else                                                                                                                                                                                                                                         
  echo "Bucket exists so i will not create the bucket"
fi                         
