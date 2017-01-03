#!/usr/bin/ruby
require 'json'
require 'open-uri'
require 'mechanize'
require 'colorize'

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
agent = Mechanize.new
agent.robots = false
agent.user_agent_alias = 'Mac Safari'
query = URI::encode(ARGV.join(' '))
url = 'http://fanyi.youdao.com/openapi.do?keyfrom=google-youdao&key=814771929&type=data&doctype=json&version=1.1&q='
url += query
begin
    json = agent.get(url).body
rescue Exception => ex
    puts "Error: #{ex.message}"
end
result = JSON.parse(json)
errorcode = result['errorCode']
if errorcode != 0
	abort (error_code[errorcode])
end
query = result['query'] + ':'
phonetic = ''
unless result['basic'].nil?
    unless result['basic']['phonetic'].nil?
        phonetic = '[' + result['basic']['phonetic'] + ']'
        phonetic = '音标: '.colorize(:color => :cyan,:mode => :bold) + phonetic.colorize(:yellow)
        unless result['basic']['uk-phonetic'].empty?
            uk_phonetic = '[' + result['basic']['uk-phonetic'] + ']'
            phonetic += "\t" + '英音: '.colorize(:color => :cyan,:mode => :bold) + uk_phonetic.colorize(:yellow)
        end
        unless result['basic']['us-phonetic'].empty?
            us_phonetic = '[' + result['basic']['us-phonetic'] + ']'
            phonetic += "\t" + '美音: '.colorize(:color => :cyan,:mode => :bold) + us_phonetic.colorize(:yellow)
        end
    end
end
puts query.colorize(:color => :light_white,:mode => :bold)
unless phonetic.empty?
    puts phonetic
end
puts '翻译:'.colorize(:color => :cyan,:mode => :bold)
result['translation'].each {|trans| puts "\t" + trans.colorize(:yellow)}
unless result['basic'].nil?
    puts '基本词典:'.colorize(:color => :cyan,:mode => :bold)
    result['basic']['explains'].each {|basedic| puts "\t" + basedic.colorize(:yellow)}
end
unless result['web'].nil?
    puts '网络释义:'.colorize(:color => :cyan,:mode => :bold)
    result['web'].each {|web| puts "\t" + web['key'].colorize(:blue) + ' : ' + web['value'].join(',')}
end
