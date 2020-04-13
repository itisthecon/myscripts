#!/usr/bin/env ruby
require 'json'
require 'colorize'
require 'net/http'
require 'uri'

if ARGV.empty?
	abort ("有道在线词典控制台Ruby版\n用法:yd 单词 单词 ...")
end
error_code = {
	0 => '正常',
	20 => '要翻译的文本过长',
	30 => '无法进行有效的翻译',
	40 => '不支持的语言类型',
	50 => '无效的key',
	60 => '无词典结果，仅在获取词典结果生效'
}
query = URI.encode_www_form_component(ARGV.join(' '))
url = 'http://fanyi.youdao.com/openapi.do?keyfrom=google-youdao&key=814771929&type=data&doctype=json&version=1.1&q='
url += query
uri = URI.parse(url)

response = Net::HTTP.get_response(uri)
result = JSON.parse(response.body)
errorcode = result['errorCode']
if errorcode != 0
	abort (error_code[errorcode])
end
query = result['query'] + ':'
has_phonetic = false
has_basic = false
if result['basic']
    has_basic =true
end
if has_basic
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
            phonetic += "\t" + '美音: '.colorize(:color => :cyan,:mode => :bold) + us_phonetic.colorize(:yellow)
        end
    end
end
puts query.colorize(:color => :light_white,:mode => :bold)
if has_phonetic
    puts phonetic
end
puts '翻译:'.colorize(:color => :cyan,:mode => :bold)
for trans in result['translation']
    puts "\t" + trans.colorize(:yellow)
end
if has_basic
    puts '基本词典:'.colorize(:color => :cyan,:mode => :bold)
    for basedic in result['basic']['explains']
        puts "\t" + basedic.colorize(:yellow)
    end
end
if result['web']
    puts '网络释义:'.colorize(:color => :cyan,:mode => :bold)
    for web in result['web']
        puts "\t" + web['key'].colorize(:blue) + ' : ' + web['value'].join(',')
    end
end
