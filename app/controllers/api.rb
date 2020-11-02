
require 'net/http'
require 'json'
# 1.urlを解析する
uri = URI.parse("https://at-anytime.jp/api/v1/login")
# 2.httpの通信を設定する
# 通信先のホストやポートを設定
https = Net::HTTP.new(uri.host, uri.port)
# httpsで通信する場合、use_sslをtrueにする
https.use_ssl = true
# 3.リクエストを作成する
request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
# 4.リクエストを投げる/レスポンスを受け取る
request.body = { "email": "user@test.jp", "password": "passw0rd" }.to_json
response = https.request(request)
# 5.データを変換する
hash = JSON.parse(response.body)


