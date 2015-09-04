# coding:utf8
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.views.decorators.gzip import gzip_page
from mining.main import girls, boys, popular, grind
from mining.models import Info

__author__ = 'cyh'



def main_view(request):
    girlList = makeContext(girls)
    boyList = makeContext(boys)
    popList = makeContext(popular)
    grindList=makeContext(grind)
    context = {'tops': [
        {'List': girlList, 'name': '女神'},
        {'List': boyList, 'name': '男神'},
        {'List': popList, 'name': '人气'},
        {'List': grindList, 'name': '学霸'}
    ]}
    return render_to_response('index.min.html', context)


def makeContext(lists):
    List = []

    i = 0
    for li in lists:
        item = Info.objects.get(id=li['id'])
        if li['background'] == 1:
            img = item.img1
        elif li['background'] == 2:
            img = item.img2
        elif li['background'] == 3:
            img = item.img3
        i += 1
        List.append({
            'id': item.id,
            'background': img,
            'no': i,
            'name': item.name,
            'pageview': item.pageview,
            'like': item.recommendations,
            'say': li['say'],
            'img1': item.img1,
            'img2': item.img2,
            'img3': item.img3,
            'intro1': item.intro1,
            'intro2': item.intro2,
            'intro3': item.intro3
        })

    return List