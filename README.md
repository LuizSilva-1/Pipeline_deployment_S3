# 🚀 Deploy Automatizado com GitHub Actions e Terraform

Este projeto foi desenvolvido como parte do trabalho de pós-graduação em DevOps, com o objetivo de demonstrar uma pipeline CI/CD completa utilizando GitHub Actions e Terraform para provisionamento e deploy automático de um site estático na AWS S3.

---

## 📌 Objetivos do Trabalho

- Criar infraestrutura como código (IaC) utilizando Terraform
- Integrar o processo de provisionamento com GitHub Actions
- Executar deploy de forma automatizada e segura em ambiente AWS
- Aplicar controle de aprovação manual antes do deploy

---

## 🛠️ Tecnologias Utilizadas

| Ferramenta     | Função                              |
|----------------|-------------------------------------|
| **Terraform**  | Criação do bucket S3 e configuração do site |
| **GitHub Actions** | Pipeline CI/CD com controle de fluxo |
| **AWS S3**      | Hospedagem do site estático         |
| **HTML/CSS**    | Conteúdo da aplicação estática       |

---

## ⚙️ Como funciona a pipeline

1. **Disparo manual ou via Pull Request**
2. **Job `build`:** simula validação da aplicação
3. **Job `terraform-apply`:** aplica infraestrutura na AWS
4. **Job `deploy`:** só executa com aprovação manual
5. **Deploy final:** envia o conteúdo da pasta `public/` para o S3
6. **Site publicado automaticamente**

---

## 🔒 Controle de Aprovação

A execução do deploy só ocorre após aprovação manual via ambiente `production` no GitHub Actions, respeitando as boas práticas de CI/CD e segurança.

---

## 🌐 Resultado Final

Site acessível automaticamente após o pipeline:

📎 URL: [http://meepo-arc-luiz-puc-minas.s3-website-us-east-1.amazonaws.com](http://meepo-arc-luiz-puc-minas.s3-website-us-east-1.amazonaws.com)

---

## 📸 Evidências

- Execução da pipeline via GitHub Actions
- Criação automática da infraestrutura
- Deploy do conteúdo estático
- Acesso público ao site pela URL do S3

---

## 👨‍💻 Autor

**Luiz Fernando**  
Aluno de Pós-Graduação em DevOps  
PUC Minas – 2025
