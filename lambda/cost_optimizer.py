import boto3
import os

# Create EC2 client
ec2 = boto3.client("ec2")

# Read environment variable
DELETE_ENABLED = os.environ.get("DELETE_ENABLED", "false").lower() == "true"

# Get all EBS volumes
response = ec2.describe_volumes()

print("Unused EBS Volumes\n")

deleted = []

for volume in response["Volumes"]:

    if volume["State"] == "available":

        volume_id = volume["VolumeId"]

        print(f"Volume ID : {volume_id}")
        print(f"State     : {volume['State']}")
        print(f"Size      : {volume['Size']} GB")
        print("-" * 40)

        if DELETE_ENABLED:
            ec2.delete_volume(VolumeId=volume_id)
            deleted.append(volume_id)
            print(f"Deleted Volume: {volume_id}")
        else:
            print("DRY RUN MODE - Volume not deleted\n")

print("\nSummary")
print(f"Delete Enabled : {DELETE_ENABLED}")
print(f"Deleted Volumes: {deleted}")