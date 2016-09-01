#!/usr/bin/env ruby
require 'json'
require 'open-uri'
require 'mechanize'
require 'colorize'

error_code = {
	0.to_s.to_sym => '正常',
	20.to_s.to_sym => '要翻译的文本过长',
	30.to_s.to_sym => '无法进行有效的翻译',
	40.to_s.to_sym => '不支持的语言类型',
	50.to_s.to_sym => '无效的key',
	60.to_s.to_sym => '无词典结果，仅在获取词典结果生效'
}
agent = Mechanize.new
agent.user_agent_alias = 'Mac Safari'
query = URI::encode(ARGV.join(' '))
url = 'http://fanyi.youdao.com/openapi.do?keyfrom=google-youdao&key=814771929&type=data&doctype=json&version=1.1&q='
url += query
begin
    json = agent.get(url).body
rescue Exception => ex
    log.error "Error: #{ex}"
end
result = JSON.parse(json)
errorcode = result['errorCode']
if errorcode != 0
	abort (error_code[errorcode.to_s.to_sym])
end
query = result['query'] + ':'
has_phonetic = false
if result['basic']['phonetic']
    has_phonetic = true
    phonetic = '[' + result['basic']['phonetic'] + ']'
    phonetic = '音标: '.colorize(:color => :cyan,:mode => :bold) + phonetic.colorize(:yellow)
    if result['basic']['uk-phonetic']
        uk_phonetic = '[' + result['basic']['uk-phonetic'] + ']'
        phonetic += "\t" + '英音: '.colorize(:color => :cyan,:mode => :bold) + uk_phonetic.colorize(:yellow)
    end
    if result['basic']['us-phonetic']
        us_phonetic = '[' + result['basic']['us-phonetic'] + ']'
        phonetic += "\t" + '英音: '.colorize(:color => :cyan,:mode => :bold) + us_phonetic.colorize(:yellow)
    end
end
puts query.colorize(:color => :light_white,:mode => :bold)
if has_phonetic
    puts phonetic
    #puts '音标: '.colorize(:color => :cyan,:mode => :bold) + phonetic.colorize(:yellow) + "\t" + '英音: '.colorize(:color => :cyan,:mode => :bold) + uk_phonetic.colorize(:yellow) + "\t" + '美音: '.colorize(:color => :cyan,:mode => :bold) + us_phonetic.colorize(:yellow)
end
puts '翻译:'.colorize(:color => :cyan,:mode => :bold)
for trans in result['translation']
    puts "\t" + trans.colorize(:yellow)
end
puts '基本词典:'.colorize(:color => :cyan,:mode => :bold)
for basedic in result['basic']['explains']
    puts "\t" + basedic.colorize(:yellow)
end
puts '网络释义:'.colorize(:color => :cyan,:mode => :bold)
for web in result['web']
    puts "\t" + web['key'].colorize(:blue) + ' : ' + web['value'].join(',')
end
