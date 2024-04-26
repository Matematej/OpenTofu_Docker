# Get official opentofu image that has terraform installed
FROM ghcr.io/opentofu/opentofu:latest

# Create directory for Terraform files
RUN mkdir -p /opentofu

# Copy tf files from the local into the container
COPY provider.tf /opentofu/provider.tf
COPY open_tofu_lab/Lab#1_VPC/* /opentofu/
#COPY open_tofu_lab/Lab#2_Backend/* /opentofu/
#COPY open_tofu_lab/Lab#3_Prostředí/* /opentofu/

# Copy entrypoint script
COPY entrypoint.sh /opentofu/entrypoint.sh

# Define a volume for persisting Terraform state
VOLUME /terraform/state

# Commands will be executed relative to /opentofu directory
WORKDIR /opentofu

# When the container starts, it will execute this script
ENTRYPOINT ["./entrypoint.sh"]