# 使用官方的 Ruby 镜像
FROM ruby:3.2.2

# 设置工作目录
WORKDIR /app

# 安装 Rails 依赖
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# 安装 Rails gem
RUN gem install bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install

# 复制应用程序代码
COPY . .

# 启动 Rails 服务器
CMD ["rails", "server", "-b", "0.0.0.0"]
