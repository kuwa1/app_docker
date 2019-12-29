# ベースイメージの設定
FROM ruby:2.4.3
# 環境変数の設定
ENV WORK_DIR /work
ENV APP_ROOT /docker_sample_app
# コンテナ上で関連パッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs build-essential libpq-dev postgresql-client
# コンテナ上でフォルダを作成
RUN mkdir $WORK_DIR
RUN cd $WORK_DIR
RUN mkdir $APP_ROOT
# 作業ディレクトの設定
WORKDIR $APP_ROOT
# Gemfileをコンテナ上にコピー
ADD Gemfile ${APP_ROOT}/Gemfile
ADD Gemfile.lock ${APP_ROOT}/Gemfile.lock
# コンテナ上でbundle install
RUN bundle install
# rootフォルダ配下をコンテナ上にコピー
ADD . $APP_ROOT