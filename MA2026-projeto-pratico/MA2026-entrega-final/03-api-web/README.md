# Etapa API Web — Consumo da API Adzuna

## Objetivo
Consultar vagas na API REST Adzuna com termos relacionados à área de Tecnologia no Brasil, normalizar campos JSON e exportar os resultados para CSV.

## Fonte e formato
- Provedor: Adzuna
- Método: HTTP GET
- Endpoint: `/v1/api/jobs/br/search/{pagina}`
- Resposta: JSON
- Saída: `dados/vagas_adzuna.csv` (separador `;`, UTF-8 com BOM)

## Campos exportados
ID, título, empresa, localidade, data de publicação, salário mínimo/máximo, tipo de contrato, categoria, URL, descrição, termo de busca, fonte e data/hora da coleta.

## Pré-requisitos e instalação
- Python 3.10 ou superior.
- Credenciais válidas Adzuna (`app_id` e `app_key`).
- Acesso à internet.

Na pasta deste projeto, execute:

```bash
python -m pip install -r requirements.txt
```

```powershell
$env:ADZUNA_APP_ID="SEU_APP_ID"
$env:ADZUNA_APP_KEY="SUA_APP_KEY"
```

## Execução

```bash
python consultar_adzuna.py
```

O script consulta `tecnologia`, `desenvolvedor` e `analista de sistemas`, coleta até duas páginas por termo, remove duplicatas e grava `dados/vagas_adzuna.csv`.
