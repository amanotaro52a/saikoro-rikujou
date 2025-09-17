FROM ruby:3.2.6
ENV APP /app
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
  && apt-get update -qq \
  && apt-get install -y build-essential postgresql-client nodejs \
  && npm install --global yarn

WORKDIR $APP

COPY Gemfile Gemfile.lock $APP/
RUN bundle install

COPY . $APP/

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]