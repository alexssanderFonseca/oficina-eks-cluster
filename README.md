# Cluster EKS com Terraform e GitHub Actions

Este repositório contém o código Terraform para criar e gerenciar um cluster Amazon EKS (Elastic Kubernetes Service). Ele também inclui fluxos de trabalho do GitHub Actions para CI/CD.

## Módulos Terraform

O código Terraform está organizado nos seguintes arquivos:

- `vpc.tf`: Cria a VPC, sub-redes e outros recursos de rede.
- `eks-cluster.tf`: Cria o cluster EKS.
- `eks-node.tf`: Cria o grupo de nós do EKS.
- `sg.tf`: Cria os grupos de segurança.
- `variables.tf`: Contém as definições das variáveis.
- `vars.tf`: Contém os valores das variáveis.
- `backend.tf`: Configura o backend do Terraform.
- `providers.tf`: Configura os provedores do Terraform.
- `data.tf`: Define as fontes de dados.
- `output.tf`: Define as saídas.
- `eks_access_entry.tf`: Gerencia as entradas de acesso para o cluster EKS.

## Fluxos de Trabalho do GitHub Actions

O repositório inclui os seguintes fluxos de trabalho do GitHub Actions:

- `ci-pipeline.yml`: Pipeline de integração contínua que executa `terraform validate` e `terraform plan`.
- `cd-pipeline.yml`: Pipeline de implantação contínua que executa `terraform apply`.
- `manual-destroy-terraform.yml`: Fluxo de trabalho manual para destruir os recursos do Terraform.
- `reusable-plan-terraform.yml`: Fluxo de trabalho reutilizável para `terraform plan`.
- `reusable-pr.yml`: Fluxo de trabalho reutilizável para pull requests.

## Como usar

1.  **Configure as credenciais da AWS:**
    -   Adicione seu ID de chave de acesso e chave de acesso secreta da AWS como segredos no repositório do GitHub com os nomes `AWS_ACCESS_KEY_ID` e `AWS_SECRET_ACCESS_KEY`.
2.  **Personalize as variáveis:**
    -   Atualize o arquivo `terraform/vars.tf` com seus valores específicos para o nome do cluster, região e outras variáveis.
3.  **Crie um pull request:**
    -   Crie uma nova branch, faça suas alterações e crie um pull request.
    -   Isso acionará o fluxo de trabalho `ci-pipeline.yml`, que executará `terraform validate` e `terraform plan`.
4.  **Faça o merge para a main:**
    -   Após a revisão e aprovação do pull request, faça o merge na branch `main`.
    -   Isso acionará o fluxo de trabalho `cd-pipeline.yml`, que executará `terraform apply` para criar ou atualizar o cluster EKS.
5.  **Destrua os recursos:**
    -   Para destruir os recursos criados pelo Terraform, acione manualmente o fluxo de trabalho `manual-destroy-terraform.yml`.
