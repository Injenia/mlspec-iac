## Project Init
- Create the terraform bucket:
    ```bash
    $ gsutil mb -p mlteam-ml-specialization-2021 -c STANDARD -l EUROPE-WEST1 -b on gs://mlspec-iac
    $ gsutil versioning set on gs://mlspec-iac
    ```
- Terraform init:
    ```
    $ cd iac/terraform
    $ terraform init
    Initializing the backend...

    Successfully configured the backend "gcs"! Terraform will automatically
    use this backend unless the backend configuration changes.
    $ terraform validate
    ```

- Connect the Github account
> At the time of writing, the Github `Connect repository` process cannot be automatizated
    - Steps:
        1. Open Google Cloud Console -> Cloud Build 
        2. Select "CONNECT REPOSITORY"
        3. Select GitHub and follow the page steps

- Run the terraform scripts:
    ```
    # Folder: /iac/terraform
    $ terraform fmt && terraform validate && terraform plan -out out.tfplan
    $ terraform apply out.plan
    ```
    