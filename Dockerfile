FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# yarn�ѥå����������ġ���򥤥󥹥ȡ���
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

# Node.js�򥤥󥹥ȡ���
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
apt-get install nodejs

RUN mkdir /portfolio_1
WORKDIR /portfolio_1
COPY Gemfile /portfolio_1/Gemfile
COPY Gemfile.lock /portfolio_1/Gemfile.lock
RUN bundle install
COPY . /portfolio_1

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]