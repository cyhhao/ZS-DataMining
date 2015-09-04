# coding:utf8
import json
import os
import requests

__author__ = 'yh'


def ans(req):
    j = json.loads(req.text)
    print j['status'], j['msg']
    if 'data' in j:
        print j['data']


url = "http://127.0.0.1/"

req = requests.post(url=url + 'register',
                    data={'json': json.dumps({'username': 'cyh123', 'password': '123456', }), 'type': 0})

ans(req)

req = requests.post(url=url + "login", data={'Json': json.dumps({'username': 'cyhhao', 'password': '123456'})})

req = requests.post(url=url + "friend/delete", cookies=req.cookies, data={'id': 2})

# post:data
# get:params

f = open('temp.html', 'w')
f.write(req.text.encode('utf8'))
f.close()

try:
    ans(req)
except:
    cmd = r'C:\Users\cyh\AppData\Local\360Chrome\Chrome\Application\360chrome.exe ' + 'file:///C:\Users\cyh\Documents\Projects\Pycharm\helloDjango\ZS_SNS_server\ZhuSun\sae/temp.html'
    os.system(cmd)



