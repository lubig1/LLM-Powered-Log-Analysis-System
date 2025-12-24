# LLM-Powered Log Analysis System (RAG + Anomaly Detection)



An end-to-end log analysis platform that leverages \*\*Large Language Models (LLMs)\*\*, \*\*Retrieval-Augmented Generation (RAG)\*\*, and \*\*statistical anomaly detection\*\* to automate log summarization, anomaly identification, and root-cause diagnosis.



Designed as a \*\*production-style software engineering project\*\*, focusing on scalability, modularity, and real-world log analysis workflows.



---



## Features

\- \*\*Automated Log Understanding\*\*: Uses open-source \*\*LLMs\*\* to summarize logs and generate human-readable insights.

\- \*\*RAG-Based Context Retrieval\*\*: Uses \*\*FAISS\*\* for efficient similarity search over log embeddings, enabling context-aware LLM reasoning.

\- \*\*Anomaly Detection\*\*: Combines \*\*Isolation Forest\*\* with LLM validation to identify abnormal patterns and prioritize alerts.

\- \*\*Real-Time Query API\*\*: Exposes REST APIs via \*\*FastAPI\*\* for real-time search and analysis.

\- \*\*Containerized Deployment\*\*: Packaged with \*\*Docker\*\* for easy local/cloud deployment.


---


## System Architecture


Raw Logs
│
▼
Preprocessing & Normalization
│
▼
Sentence Embeddings (Sentence-Transformers)
│
├──► FAISS Vector Index (RAG Retrieval)
│
└──► Isolation Forest (Anomaly Detection)
│
▼
LLM Reasoning & Summarization
│
▼
REST API (FastAPI)


---



## Tech Stack


\- \*\*Language:\*\* Python

\- \*\*LLM \& NLP:\*\* HuggingFace Transformers, Sentence-Transformers

\- \*\*Vector Search:\*\* FAISS

\- \*\*Anomaly Detection:\*\* Isolation Forest (scikit-learn)

\- \*\*API:\*\* FastAPI

\- \*\*Deployment:\*\* Docker

\- \*\*Utilities:\*\* NumPy, PyTorch



---



## Project Structure



```text

llm-log-analyzer/

├── app/

│   ├── api.py              # Core service logic

│   ├── ingest.py           # Log ingestion \& indexing

│   ├── preprocess.py       # Log normalization

│   ├── embeddings.py       # Text embedding pipeline

│   ├── anomaly.py          # Isolation Forest detector

│   ├── llm.py              # LLM interaction

│   └── main.py             # FastAPI entry point

├── data/

│   └── sample\_logs.txt     # Example log data

├── config.yaml

├── Dockerfile

├── requirements.txt

└── README.md

```



---



## Installation



### 1) Create a virtual environment



```bash

python -m venv .venv

source .venv/bin/activate

```



### 2) Install dependencies



```bash

pip install -r requirements.txt

```



---



## Build Index \& Models



```bash

python -c "from app.ingest import build\_all; build\_all('config.yaml')"

```



This step:

\- Preprocesses raw logs

\- Builds embeddings

\- Creates the FAISS index

\- Trains the anomaly detector



---



## Run the Service



```bash

uvicorn app.main:app --reload --port 8000

```



Open:

\- API: `http://127.0.0.1:8000`

\- Docs: `http://127.0.0.1:8000/docs`



---



## Example Usage



### Query logs



```bash

curl -X POST "http://127.0.0.1:8000/query"   -H "Content-Type: application/json"   -d '{"query":"database connection refused", "top\_k":5}'

```



### Retrieve top anomalies



```bash

curl "http://127.0.0.1:8000/anomalies?n=5"

```



---



## Performance Highlights (example offline evaluation)



\- \*\*32%\*\* improvement in incident matching accuracy vs. text-only baseline

\- \*\*45%\*\* reduction in false positives for latency-related anomalies

\- \*\*~40%\*\* reduction in manual triage time



> Replace the numbers above with your measured results if you run experiments on your own datasets.



---



## Datasets



\- Synthetic system logs

\- Open-source logs (e.g., Apache, Kubernetes-style logs)

\- Extensible to production logs



---



## Extensibility Ideas



\- Swap LLMs (Llama / Qwen / Mistral)

\- Add streaming ingestion (Kafka / Pulsar)

\- Integrate metrics (Prometheus)

\- Extend to traces/metrics or multimodal inputs



---



## Author



\*\*Zhaohong Lu\*\*  

Ph.D. Candidate, Electrical Engineering — Virginia Tech



---



## License



Released for educational and research purposes.






