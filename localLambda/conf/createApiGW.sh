ENVIRONMENT_NAME=dev
REST_API_ID=`terraform output api_gateway_sethu_blog_reader_id`
aws apigateway put-rest-api --region ap-southeast-2 --rest-api-id=$REST_API_ID --fail-on-warnings --body file://swagger.yml --profile lambda-workshop
aws apigateway create-deployment --region ap-southeast-2 --rest-api-id=$REST_API_ID --stage-name $ENVIRONMENT_NAME --variables "stageName=$ENVIRONMENT_NAME" --profile lambda-workshop
