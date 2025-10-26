# ベースイメージ   
FROM ruby:3.3

# 環境変数
ENV LANG=C.UTF-8 \
    RAILS_ENV=test \
    NODE_VERSION=20 \
    BUNDLER_VERSION=2.7.2 \
    # headless Chrome 用
    DISPLAY=:99

# 必須パッケージの小分けインストール
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    wget \
    gnupg2 \
    unzip \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    xdg-utils \
    libasound2 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    postgresql-client \
    default-mysql-client \
    chromium \
    chromium-driver \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Node.js インストール
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Yarn インストール
RUN curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/yarn.gpg] https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq && apt-get install -y --no-install-recommends yarn \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Google Chrome 
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update -qq && apt-get install -y --no-install-recommends google-chrome-stable \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ
WORKDIR /myapp

# Gemfile コピー & Bundler バージョン固定
COPY Gemfile* ./
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle _${BUNDLER_VERSION}_ install

# アプリコピー
COPY . ./

# system spec 実行用に環境変数設定
ENV RAILS_ENV=test
ENV BUNDLE_JOBS=4
ENV BUNDLE_PATH=/gems
