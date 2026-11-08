# Modelo Relacional - Etapa 03

**Projeto:** Análise do Mercado de Trabalho em Tecnologia  
**Arquivo Base:** `Etapa 03 - PowerPivot.xlsx`  

---

## 1. Estrutura do Modelo

O modelo adota uma arquitetura simplificada focada na análise de vagas e conciliação de dados.

### Tabelas do Modelo

| Tabela | Tipo | Descrição | Registros |
| :--- | :--- | :--- | :--- |
| **`fVagas`** | Fato | Vagas de TI tratadas e validadas | 1.115 |
| **`Tratado`** | Staging | Espelho da base limpa da Etapa 01/02 | 1.150 |
| **`fVagas_Rejeitados`** | Auditoria | Registros descartados no tratamento | 35 |
| **`dCalendario`** | Dimensão | Tabela contínua de datas (marcada como Tabela de Datas) | Dinâmico |

---

## 2. Relacionamentos

* **`dCalendario[Data]` $\rightarrow$ `fVagas[Data_Publicacao_Data]`**
  * **Cardinalidade:** 1 para Muitos ($1:N$)
  * **Direção do Filtro:** Única (da dimensão `dCalendario` para a fato `fVagas`)

* **Observação:** As tabelas `Tratado` e `fVagas_Rejeitados` permanecem **sem relacionamentos** no modelo, atuando exclusivamente no painel de conciliação para garantir a auditoria de **Diferença Zero**.