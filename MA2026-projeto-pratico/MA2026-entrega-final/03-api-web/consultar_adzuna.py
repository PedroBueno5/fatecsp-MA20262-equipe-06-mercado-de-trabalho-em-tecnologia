"""Consome a API REST Adzuna e exporta vagas de tecnologia para CSV.
Credenciais via variaveis de ambiente ADZUNA_APP_ID e ADZUNA_APP_KEY.
"""
import csv
import os
import sys
import time
from datetime import datetime, timezone
from pathlib import Path
import requests

BASE_URL = "https://api.adzuna.com/v1/api/jobs/br/search"
OUTPUT_DIR = Path(__file__).resolve().parent / "dados"
OUTPUT_FILE = OUTPUT_DIR / "vagas_adzuna.csv"
SEARCH_TERMS = ["tecnologia", "desenvolvedor", "analista de sistemas"]
RESULTS_PER_PAGE = 50
MAX_PAGES_PER_TERM = 2
TIMEOUT_SECONDS = 30
FIELDS = ["id", "titulo", "empresa", "localidade", "data_publicacao", "salario_min", "salario_max", "tipo_contrato", "categoria", "url_vaga", "descricao", "termo_busca", "fonte", "coletado_em_utc"]


def credentials():
    app_id = os.getenv("ADZUNA_APP_ID", "").strip()
    app_key = os.getenv("ADZUNA_APP_KEY", "").strip()
    if not app_id or not app_key:
        raise RuntimeError("Configure ADZUNA_APP_ID e ADZUNA_APP_KEY nas variaveis de ambiente.")
    return app_id, app_key


def txt(value):
    return "" if value is None else str(value).replace("\r", " ").replace("\n", " ").strip()


def normalize(job, term):
    company = job.get("company") or {}
    location = job.get("location") or {}
    category = job.get("category") or {}
    return {
        "id": txt(job.get("id")), "titulo": txt(job.get("title")),
        "empresa": txt(company.get("display_name")),
        "localidade": txt(location.get("display_name")),
        "data_publicacao": txt(job.get("created")),
        "salario_min": job.get("salary_min", ""), "salario_max": job.get("salary_max", ""),
        "tipo_contrato": txt(job.get("contract_type")),
        "categoria": txt(category.get("label")), "url_vaga": txt(job.get("redirect_url")),
        "descricao": txt(job.get("description")), "termo_busca": term,
        "fonte": "Adzuna", "coletado_em_utc": datetime.now(timezone.utc).isoformat(timespec="seconds")
    }


def fetch_term(session, app_id, app_key, term):
    rows = []
    for page in range(1, MAX_PAGES_PER_TERM + 1):
        response = session.get(f"{BASE_URL}/{page}", params={
            "app_id": app_id, "app_key": app_key, "results_per_page": RESULTS_PER_PAGE,
            "what": term, "where": "Brasil", "content-type": "application/json"
        }, timeout=TIMEOUT_SECONDS)
        response.raise_for_status()
        payload = response.json()
        results = payload.get("results", [])
        if not isinstance(results, list) or not results:
            break
        rows.extend(normalize(job, term) for job in results)
        if len(results) < RESULTS_PER_PAGE:
            break
        time.sleep(0.5)
    return rows


def main():
    try:
        app_id, app_key = credentials()
        OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
        collected = []
        with requests.Session() as session:
            session.headers.update({"User-Agent": "MA2026-MercadoTecnologia/1.0"})
            for term in SEARCH_TERMS:
                print(f"Consultando Adzuna: {term}")
                collected.extend(fetch_term(session, app_id, app_key, term))
        unique = {}
        for row in collected:
            key = row["id"] or (row["titulo"], row["empresa"], row["localidade"])
            unique.setdefault(key, row)
        with OUTPUT_FILE.open("w", newline="", encoding="utf-8-sig") as file:
            writer = csv.DictWriter(file, fieldnames=FIELDS, delimiter=";")
            writer.writeheader()
            writer.writerows(unique.values())
        print(f"Concluido: {len(unique)} vagas salvas em {OUTPUT_FILE}")
        return 0
    except requests.HTTPError as exc:
        status = exc.response.status_code if exc.response is not None else "desconhecido"
        print(f"Erro HTTP {status}: verifique credenciais, limites e parametros da API.", file=sys.stderr)
        return 2
    except requests.RequestException as exc:
        print(f"Falha de comunicacao com a API: {exc}", file=sys.stderr)
        return 3
    except (RuntimeError, ValueError) as exc:
        print(str(exc), file=sys.stderr)
        return 4


if __name__ == "__main__":
    raise SystemExit(main())
