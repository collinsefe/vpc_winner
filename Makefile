init_vpc: clean_vpc
	@cd scripts && \
	./scripts.sh tf-state-dev001 eu-west-1
	cd .. && \
	terraform init -backend=true -backend-config="backend.config"

plan_cloudform: init_cloudform fmt_cloudform get_cloudform
	@cd ./terraform/cloudform/cloudform && \
	terraform plan -out=terraform.tfplan

plan_cloudform_download: init_cloudform clone_app_files fmt_cloudform get_cloudform
	@cd ./terraform/cloudform/cloudform && \
	terraform plan -out=terraform.tfplan

cloudform: plan_cloudform
	@cd ./terraform/cloudform/cloudform && \
	terraform apply terraform.tfplan

cloudform_download: clone_app_files plan_cloudform 
	@cd ./terraform/cloudform/cloudform && \
	terraform apply terraform.tfplan

outputs_cloudform: init_cloudform
	@cd ./terraform/cloudform/cloudform && \
	terraform output

plan_destroy_cloudform: init_cloudform
	@cd ./terraform/cloudform/cloudform && \
	terraform plan -destroy -out=terraform.tfplan

destroy_cloudform: plan_destroy_cloudform
	@cd ./terraform/cloudform/cloudform && \
	terraform destroy

fmt_cloudform:
	@cd ./terraform/cloudform/cloudform && \
	terraform fmt

get_vpc:
	terraform get

clone_app_files:
	@echo "Downloading file from repo..."
	@cd ./terraform/cloudform/application && \
	rm -rf * && \
	git clone https://code.deloittecloud.co.uk/ITS/Project_Questionnaire.git && \
	cd Project_Questionnaire/Lambda_function && \
	mv sendmail_for_questionnaire.js exports.js && \
	zip exports.zip exports.js
	cd ../../..


clean_vpc:
	@echo "Cleaning up..."
	sudo rm -rf .terraform *.tfstate *.backup

