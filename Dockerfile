FROM ruby:2.3.7-alpine
LABEL Description="This image is used to set up healthmatters app with all the dependencies" Version="1.0"

LABEL "maintainer"="Kiryl Bartashevich"

ENV \
    RAILS_ENV=test
    KIPU_URL \
    KIS_USER_TOKEN \
    KIS_URL \
    CAS_HOST \
    PGPASSWORD \
    BUNDLE_ENTERPRISE__CONTRIBSYS__COM \
    BUNDLE_GITHUB__COM \
    REDISCLOUD_URL \
    PGPASSWORD \
    POSTGRES_USER \
    POSTGRES_DB \
    POSTGRES_PASSWORD \
    POSTGRES_HOST \
    AWS_ACCESS_KEY_ID \
    AWS_SECRET_ACCESS_KEY \
    DEV_PACKAGES="qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x postgresql-contrib libpq-dev imagemagick xvfb openssl git libstdc++ libffi-dev libc-dev linux-headers libxml2-dev libxslt-dev libgcrypt-dev make netcat-openbsd bash" \
    RUBY_PACKAGES="rvm ruby-io-console ruby-json" \ 
    BUILD_PACKAGES="binutils-gold build-base curl file g++ gcc less yaml nodejs" \

RUN \
   apk update && apk add $BUILD_PACKAGES $RUBY_PACKAGES $DEV_PACKAGES   

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN \
    # bundler confidurations
    bundle config build.nokogiri "--use-system-libraries" && \
    bundle config github.com KipuDevGemsUser:dNsEPTUWMbTumnphFmtjjGb9tKKbtmxT8 && \
    bundle config enterprise.contribsys.com aa8ac900:18a34bbd && \
    # Ruby and Rails configuration and dependencies
    rvm install ruby-2.3.7 --default && \
    rvm use ruby-2.3.7@healthmatters --create && \
    gem install bundler -v 1.17.3
    
COPY . ./

ENTRYPOINT ["entrypoint.sh"]
