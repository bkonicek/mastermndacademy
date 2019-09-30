import json


def evenOdd(num):
    if int(num) % 2 == 0:
        return "even"
    return "odd"


def squareNum(num):
    return int(num) * int(num)


def squareAnyNum(event, context):
    yourNum = event["queryStringParameters"]["number"]
    body = {
        "message": "This service returns the square of a number.",
        "input": yourNum,
        "output": squareNum(yourNum)
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response


def evenOrOdd(event, context):
    yourNum = event["queryStringParameters"]["number"]
    body = {
        "message": "This service checks if your number is even or odd.",
        "input": yourNum,
        "output": evenOdd(yourNum)
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response


def hello(event, context):
    body = {
        "message": "Go Serverless v1.0! Your function executed successfully!",
        "input": event
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response

    # Use this code if you don't use the http event with the LAMBDA-PROXY
    # integration
    # """
    # return {
    #    "message": "Go Serverless v1.0! Your function executed successfully!",
    #    "event": event
    # }
    # """
