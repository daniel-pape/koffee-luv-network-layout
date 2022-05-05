init: ## Initialize the Terraform working directory
	@terraform init

plan: ## Generate the Terraform execution plan
	@AWS_PROFILE=deployer terraform plan -out "network_layout.tfplan"

apply: ## Create or update infrastructure described by the Terraform plan
	@AWS_PROFILE=deployer terraform apply "network_layout.tfplan"

destroy: ## Destroy all managed infrastructure
	@AWS_PROFILE=deployer terraform destroy

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'