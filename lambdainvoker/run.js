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
