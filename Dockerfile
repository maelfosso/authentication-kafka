FROM ruby:2.6.5-alpine

ENV BUNDLER_VERSION=2.0.2

# RUN apt-get update && apt-get install -y \
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
# && rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 2.0.2

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokigiri --use-system-libraries
RUN bundle check || bundle install

COPY . ./

# RUN chmod +x entrypoint.sh && cp entrypoint.sh /usr/local/bin
# COPY entrypoint.sh /usr/local/bin/
# RUN ln -s usr/local/bin/entrypoint.sh /

ENTRYPOINT [ "./entrypoint.sh" ] 
# "bash", "-c", 
# CMD [ "bundle", "exec", "rails", "s", "-b", "0.0.0.0" ]
# CMD [ "bundle", "exec", "karafka", "server" ]
