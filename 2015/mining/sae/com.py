# coding:utf-8
import sys
import StringIO

from django.http import HttpResponse
import time


def syncdb(request):
    # 重定向标准输出重定向到内存的字符串缓冲(由StringIO模块提供)
    saveout = sys.stdout
    log_out = StringIO.StringIO()
    sys.stdout = log_out
    # 利用django提供的命令行工具来执行“manage.py syncdb”
    from django.core.management import execute_from_command_line

    execute_from_command_line(["manage.py", "syncdb", "--noinput"])
    # 获得“manage.py syncdb”的执行输出结果，并展示在页面
    result = log_out.getvalue()
    sys.stdout = saveout
    return HttpResponse(result.replace("\n", "<br/>"))


def makemigrations(request):
    # 重定向标准输出重定向到内存的字符串缓冲(由StringIO模块提供)
    saveout = sys.stdout
    log_out = StringIO.StringIO()
    sys.stdout = log_out
    # 利用django提供的命令行工具来执行“manage.py syncdb”
    from django.core.management import execute_from_command_line

    execute_from_command_line(["manage.py", "makemigrations", "--noinput"])
    # 获得“manage.py makemigrations”的执行输出结果，并展示在页面
    result = log_out.getvalue()
    sys.stdout = saveout
    return HttpResponse(result.replace("\n", "<br/>"))


def migrate(request):
    # 重定向标准输出重定向到内存的字符串缓冲(由StringIO模块提供)
    saveout = sys.stdout
    log_out = StringIO.StringIO()
    sys.stdout = log_out
    # 利用django提供的命令行工具来执行“manage.py syncdb”
    from django.core.management import execute_from_command_line

    execute_from_command_line(["manage.py", "migrate", "--noinput"])
    # 获得“manage.py migrate”的执行输出结果，并展示在页面
    result = log_out.getvalue()
    sys.stdout = saveout
    return HttpResponse(result.replace("\n", "<br/>"))


def getTime(request):
    intTime = time.time()
    strTime = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
    return HttpResponse("intTime:%d <br>strTime:%s" % (intTime, strTime))




