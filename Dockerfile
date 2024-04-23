# Get official hashicorp image that has terraform installed
# FROM chainguard/opentofu:latest
# FROM hashicorp/terraform:latest
# FROM nginx

FROM ghcr.io/opentofu/opentofu:latest
# Create directory for Terraform files
RUN mkdir -p /opentofu

# Copy tf files from the local into the container
COPY provider.tf /opentofu/provider.tf
COPY open_tofu_lab /opentofu/open_tofu_lab

# Copy entrypoint script
COPY entrypoint.sh /opentofu/entrypoint.sh

# Define a volume for persisting Terraform state
VOLUME /terraform/state

# Commands will be executed relative to /opentofu directory
WORKDIR /opentofu

# When the container starts, it will execute this script
ENTRYPOINT ["./entrypoint.sh"]