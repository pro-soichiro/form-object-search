FROM ruby:2.7.5

ENV RAILS_ENV="production"

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn default-mysql-client
WORKDIR /app
COPY ./src /app
RUN bundle config --local set path 'vender/bundle' && bundle install

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]