# Avaliação de Precisão de Localização em Redes LoRaWAN (RSSI e TDoA)

Este repositório contém os códigos de simulação e configurações de ambiente utilizados no Trabalho de Conclusão de Curso (TCC) intitulado **"Avaliação de Precisão de Localização em Redes LoRa com base em RSSI e TDoA com auxílio de Simulações Computacionais"**, apresentado à Universidade Tecnológica Federal do Paraná (UTFPR).

## Sobre o Projeto

O objetivo deste trabalho é avaliar e comparar o desempenho de diferentes métodos de geolocalização em redes LoRaWAN em um cenário urbano real. O estudo utiliza um dataset público da cidade de Antuérpia e implementa algoritmos baseados em **RSSI** e **TDoA**, além de técnicas de refinamento como **Filtro de Kalman** e **Fusão de Dados**.

### Principais Métodos Implementados:
* **RSSI:** WCL (Weighted Centroid Localization) , Multilateração (LSE).
* **TDoA:** Algoritmo de Levenberg-Marquardt (LM) , TDoA com RANSAC (remoção de outliers).
* **Otimização:** Filtro de Kalman Linear (Modelo de Velocidade Constante).
* **Fusão:** ARFL (Adaptive Robust Fusion Layer) combinando RSSI e TDoA.
* **Machine Learning:** Rede Neural (MLP) para regressão de posicionamento baseada em RSSI e últimos dados conhecidos.

## Estrutura do Repositório

* `Simulacoes.py`: Script principal contendo a lógica dos algoritmos de localização (WCL, TDoA, Kalman, RANSAC e ARFL). Processa as trilhas e calcula os erros.
* `Treino_RN.py`: Script para pré-processamento de dados, criação, treinamento e validação da Rede Neural (TensorFlow/Keras).
* `Calibracao.py`: Realiza a calibração dos parâmetros de *path loss* ($A$ e $n$) utilizando regressão linear nos dados do dataset.
* `Analise_dados.py`: Análise exploratória dos dados (distribuição de RSSI, SNR, SF, contagem de gateways).
* `Analise_geografica.py`: Geração de mapas interativos e visualização da área de cobertura e disposição dos gateways.
* `Simulacoes_resultados.py`: Gera gráficos comparativos (CDF, Boxplots) e tabelas de métricas baseados nos resultados das simulações.
* `Dockerfile` & `docker-compose.yml`: Configuração do ambiente de desenvolvimento conteinerizado (Jupyter Lab com suporte a GPU).

## Como Executar (Docker)

Este projeto foi desenvolvido para rodar em contêineres Docker, garantindo que todas as bibliotecas (TensorFlow, GeoPandas, Plotly, etc.) funcionem corretamente sem conflitos.

### Pré-requisitos
* Docker e Docker Compose instalados.
* Drivers da NVIDIA (opcional, caso queira usar aceleração de GPU para a Rede Neural).

### Passos para Instalação

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/juliohmb/TCC_AVALIACAO_DE_PRECIS-O_DE_LOCALIZA-O_EM_REDES_LORA.git
    cd TCC_AVALIACAO_DE_PRECIS-O_DE_LOCALIZA-O_EM_REDES_LORA
    ```

2.  **Inicie o ambiente:**
    Utilize o `docker-compose` para construir a imagem e subir o contêiner do Jupyter Lab.
    ```bash
    docker-compose up --build
    ```

3.  **Acesse o Jupyter Lab:**
    * Abra o navegador em: `http://localhost:8888`
    * Senha/Token padrão: `tcc` (configurado no `docker-compose.yml`)

4.  **Estrutura de Pastas:**
    O diretório local onde o comando foi executado será mapeado para `/home/jovyan/work` dentro do contêiner. Certifique-se de colocar os arquivos `.json` do dataset na raiz ou ajustar os caminhos nos scripts.

## Dataset

O projeto utiliza o dataset público: **"LoRaWAN dataset for fingerprint localization in large urban and rural areas"** (Aernouts et al., 2018). 
* `lorawan_antwerp_2019_dataset.json`: Dados de transmissão.
* `lorawan_antwerp_gateway_locations.json`: Localização dos gateways.

> **Nota:** Os arquivos JSON do dataset não estão incluídos no repositório.