#!/bin/bash
set -x

LAMBDA_NAME="csd215-lambda"

if [[ -z "$LAMBDA_NAME" ]]; then
    echo "Error: LAMBDA_NAME is not set."
    exit 1
fi

echo "--- Starting deployment for $LAMBDA_NAME ---"

echo "[1/4] Cleaning up previous builds..."
rm -rf lambda_package
rm -f lambda_function.zip

mkdir -p lambda_package/app

echo "[2/4] Copying application files..."
cp ./app/lambda_app.py lambda_package
cp ./app/__init__.py ./app/core.py ./app/data.py ./app/lambda_app.py lambda_package/app

echo "[3/4] Packaging the Lambda function..."
cd lambda_package
zip -r9 ../lambda_function.zip ./app ./lambda_app.py -x '*.git*' -x '*.DS_Store'
cd ..

echo "[4/4] Deploying to AWS Lambda..."
aws lambda update-function-code --function-name "$LAMBDA_NAME" --zip-file fileb://lambda_function.zip