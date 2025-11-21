FROM quay.io/jupyter/tensorflow-notebook:cuda-latest

# -----------------------------------------------------------------
# 1. Mude para root para instalar dependências do sistema
# -----------------------------------------------------------------
USER root

# Instala as bibliotecas de sistema necessárias
RUN apt-get update && apt-get install -y \
    libnss3 \
    libxss1 \
    libasound2t64 \
    libxtst6 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libgbm1 \
    libcups2 \
    libdrm2 \
    libfontconfig1 \
    libx11-xcb1 \
    libxcomposite1 \
    libxrandr2 \
    libxcursor1 \
    libxdamage1 \
    libnspr4 \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# -----------------------------------------------------------------
# 2. Volte para o usuário padrão do notebook
# -----------------------------------------------------------------
USER $NB_USER

# -----------------------------------------------------------------
# 3. Instale suas bibliotecas Python
# -----------------------------------------------------------------
RUN pip install --no-cache-dir \
    pandas \
    geopandas \
    contextily \
    matplotlib \
    shapely \
    numpy \
    seaborn \
    tqdm \
    scipy \
    plotly \
    kaleido \
    ipywidgets \
    ipython \
    scikit-learn \
    tensorflow \
    joblib