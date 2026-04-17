# Lab - Week 4 - Introduction to AWS Compute Resources

## Ex1. `EC2` Basics
Everything should be pretty well spelled-out in the student facing version of this. Students may have trouble, though, with `ssh` and `scp`. Ensure that they downloaded their PEM, changed the permissions correctly, and have it in the right path (and are referring to it by the correct name in the `ssh` command).

**REMIND STUDENTS TO TERMINATE THEIR INSTANCES** after they are finished.

## Ex2. `Lambda` Functions

Again, this should be fairly straightforward. Common errors from the Lambda console: students may forget to deploy their lambda functions (only saving changes), they may not know how to read data from their even JSON (it'll automatically be read in as a dictionary in Python), they may not remember how to set up test cases, etc.

```python
def is_prime(n):
    """Check if n is a prime number."""
    if n <= 1:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True

def lambda_handler(event, context):
    # TODO
    N = event.get('number', 100)
    list_of_primes = [n for n in range(2, N+1) if is_prime(n)]

    return {
        'statusCode': 200,
        'body': list_of_primes
    }
```
- Copy-paste your code to Lambda, deploy it, and test with Event JSON
    ```json
    {
        'number': 200
    }
    ```

2. See code in [solutions notebook](KEY_lab4_lambda_step.ipynb) and the structure for Lambda function deployment via zipped file in `./lab4.py.zip` (all they need to do is zip up a Python script) and fill in the name of their module vs. Python function. ***Be conservative on concurrent lambda invocations. AWS Academy will deactivate student accounts if they go above 10 concurrent invocations.*** All the sample code has been modified to invoke far fewer than 10 workers at a time (4-5) to avoid this happening.

Might want to also have students take a look at how this launches the function in their console to demonstrate that they did the same thing as in (1) -- just programmatically and in a lot more reproducible fashion.

## Go over assignment for this week

Highlight that they don't need to use multithreading package to invoke Lambda (this often appears in students assignments if it is not mentioned). This is only intended to show that it can scale to bigger problem sizes automatically.