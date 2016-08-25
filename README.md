## Setup

Link to the console and user id password:

```
https://sethu-personal.signin.aws.amazon.com/console
get userid and password from me
```

Your very first Lambda:

## Simple Calculator:

```
exports.handler = (event, context, callback) => {
    var sum = event.first + event.second;
    callback(null, 'Sum = '+sum);
};
```

## Invoking a Lambda function:
First set up aws cli.
You can use aws configure or create the ~/.aws/credentials file. Ensure the profile is called lambda-workshop
```
[lambda-workshop]
aws_access_key_id=<get key from me>
aws_secret_access_key=<get key from me>
```

Invoking code:

```
var aws = require('aws-sdk');

var lambda = new aws.Lambda({region:'ap-southeast-2'});

var params = {
	FunctionName: 'function arn',
	Payload: JSON.stringify({
		first: 10,
		second: 20
	}),
}

lambda.invoke(params, function(error, data){
	if(error) console.log('error occurred', error);
	if(data) console.log('success!', data);
})
```

Executing the code:

```
AWS_PROFILE=lambda-workshop node src/run.js
```

## Developing a lambda locally
