FROM ruby:2.6.5-alpine

ENV BUNDLER_VERSION=2.0.2

RUN apk add --update --no-cache \
  binutils-gold \
  build-base \
  curl \
  file \
  g++ \
  gcc \
  git \
  less \
  libstdc++ \
  libffi-dev \
  libc-dev \
  linux-headers \
  libxml2-dev \
  libxslt-dev \
  libgcrypt-dev \
  make \
  netcat-openbsd \
  nodejs \
  openssl \
  pkgconfig \
  python \
  tzdata \
  yarn

RUN gem install bundler -v 2.0.2

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokigiri --use-system-libraries
RUN bundle check || bundle install

COPY . ./

RUN chmod +x entrypoint.sh

# ENTRYPOINT [ "sh", "./entrypoint.sh" ]
# CMD [ "bundle", "exec", "karafka", "server" ]
