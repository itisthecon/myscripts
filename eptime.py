#!/usr/bin/env python
# -*- coding: utf-8 -*-

from datetime import datetime
import getopt,sys

opts, args = getopt.getopt(sys.argv[1:], 'd:h?v')
dt = datetime.now()
tm = dt.timestamp()
hasdate = False;
for o, v in opts:
    if o == '-d':
        try:
            dt = datetime.strptime ( v, '%Y-%m-%d' )
        except ValueError:
            print( '-d 后请输入"年-月-日"形式的日期。' )
            sys.exit(2)
        print ( dt )
        print ( int ( dt.timestamp() ) )
        hasdate = True
    if o == '-h' or o == '-?' or o == '-v':
        helpinfo = '''时间/时戳互转Python版 v0.1
用法：不带参数输出当前时戳
或：eptime 时戳
或：eptime -d 年-月-日'''
        print ( helpinfo )
        sys.exit(2)
if hasdate : sys.exit(0)
if args:
    for arg in args:
        tm = arg;
        try:
             dt = datetime.fromtimestamp ( int ( tm ) )
        except ValueError:
           print( '请输入整数时戳。' )
           sys.exit(2)
        print( dt )
        print ( args[0] )
    sys.exit(0)
print ( dt )
print ( int ( tm ) )
