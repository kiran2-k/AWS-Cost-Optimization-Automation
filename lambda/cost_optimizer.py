import boto3

ec2 = boto3.client("ec2")

response = ec2.describe_volumes()

print("Unused EBS Volumes\n")

for volume in response["Volumes"]:
    if volume["State"] == "available":
        print(f"Volume ID : {volume['VolumeId']}")
        print(f"State     : {volume['State']}")
        print(f"Size      : {volume['Size']} GB")
        print("-" * 40)