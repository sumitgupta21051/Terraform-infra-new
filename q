# name: Basic RG Workflow

# on: [push]

# jobs:
#   TerraformInit:
#     name: Terraform Init
#     runs-on: ubuntu-latest #self-hosted
#     steps:
#     - name: Checkout
#       uses: actions/checkout@v5.0.0
#     - name: Setup Terraform
#       uses: hashicorp/setup-terraform@v3
#       with:
#         terraform_version:  1.11.4 #1.5.7 
#     - name: Azure Login   
#       uses: Azure/login@v2.3.0
#       with:
#         creds: ${{ secrets.AZURECREDENTIAL }}
#     - name: Terraform init 
#       run: terraform init
#       working-directory: Parent_Module