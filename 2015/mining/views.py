# coding:utf-8
import json
from multiprocessing.dummy import Process
from django.db.models import Q
from django.http import HttpResponse
import jieba.posseg as pseg
from mining.models import Info, Words_Info, Words_Comment, Comment, Info2014, Comment2014, Words_Info2014, \
    Words_Comment2014, Words_Merge


def hello(request):
    it = Comment2014.objects.filter(id=2)
    return HttpResponse("" + it[0].name + it[0].text + "  %d" % it[0].now_i)


def mining_info(request):
    pro = Process(target=mining_words_info, name='info', args=(int(request.GET['year']),))
    pro.start()
    return HttpResponse("okok  " + Words_Info.__name__)


def mining_comment(request):
    pro = Process(target=mining_words_comment, name='comment', args=(int(request.GET['year']),))
    pro.start()
    return HttpResponse("okok  " + Words_Comment.__name__)


def merge(request):
    pro = Process(target=merge_process, name='comment', )
    pro.start()
    return HttpResponse("okok  " + Words_Merge.__name__)


def search(request):
    keyList = json.loads(request.GET['key'])
    ser = None
    for key in keyList:
        ser = (ser | Q(content__contains=key)) if ser is not None else Q(content__contains=key)
    print ser
    commentList = Comment.objects.filter(ser)


    map = {}
    for comment in commentList:
        if comment.apply_id in map:
            map[comment.apply_id] += 1
        else:
            map[comment.apply_id] = 1


    for id in map.keys():
        if Info.objects.get(id=id).deleted_at=='NULL':
            pass
        else:
            del map[id]


    map = sorted(map.items(), key=lambda d: d[1], reverse=True)
    maps = [{'background': 1, 'say': '', 'id': yz[0], 'like': yz[1]} for yz in map]
    map = [(yz[1], yz[0], Info.objects.get(id=yz[0]).name, Info.objects.get(id=yz[0]).stuid,) for yz in map]


    for li in map:
        print li[0], li[2], li[3]
    f = open("grils.json", "w")
    f.write(json.dumps(maps[0:10]))
    f.close()
    return HttpResponse(json.dumps(map[0:10]))


def merge_process():
    allList1 = Words_Info.objects.all()
    allList2 = Words_Comment.objects.all()

    allMap = {}
    for li in allList1:
        allMap[li.word] = [li.count, li.property]

    for li in allList2:
        if li.word in allMap:
            allMap[li.word] = [allMap[li.word][0] + li.count, li.property]
        else:
            allMap[li.word] = [li.count, li.property]

    save_db(allMap, Words_Merge)


def mining_words_info(year):
    if year == 2014:
        allList = Info2014.objects.all()
    else:
        allList = Info.objects.all()
    length = len(allList)
    i = 0
    map = {}
    for row in allList:
        i += 1
        if year == 2014:
            cut_and_hash(row.yijuhua, map)
            cut_and_hash(row.Njuhua, map)
        elif row.deleted_at == 'NULL':
            cut_and_hash(row.story, map)
            cut_and_hash(row.whoami, map)
            cut_and_hash(row.title, map)
            cut_and_hash(row.insufficient, map)

        per = (i + 0.0) / length * 100
        print "\r申报：----正在处理第", i, "个---共", length, "个---已完成", per, "% -----",

    print '\r申报：开始写数据库……',
    if year == 2014:
        save_db(map, Words_Info2014)
    else:
        save_db(map, Words_Info)


def mining_words_comment(year):
    if year == 2014:
        allList = Comment2014.objects.all()
    else:
        allList = Comment.objects.all()
    length = len(allList)
    i = 0
    map = {}
    for row in allList:
        i += 1
        if year == 2014:
            cut_and_hash(row.text, map)
        else:
            cut_and_hash(row.content, map)
        per = (i + 0.0) / length * 100
        print "\r推荐：----正在处理第", i, "个---共", length, "个---已完成", per, "% -----",

    print '\r推荐：开始写数据库……',
    if year == 2014:
        save_db(map, Words_Comment2014)
    else:
        save_db(map, Words_Comment)


def cut_and_hash(text, map):
    words = pseg.cut(text)
    for w in words:
        if 2 <= len(w.word) <= 10 and ('x' not in w.flag) and ('r' not in w.flag):
            if w.word in map:
                map[w.word] = [map[w.word][0] + 1, w.flag]
            else:
                map[w.word] = [1, w.flag]


def save_db(map, DB):
    length = len(map)
    i = 0.0
    list = []
    for key, v in map.iteritems():
        i += 1
        db = DB(word=key, count=v[0], property=v[1])
        list.append(db)

    print "写数据库，append", DB.__name__, "已完成："
    DB.objects.bulk_create(list)
    print "-----------写数据库，append", DB.__name__, "完成-----------"


def cut_and_save(this_Words, text):
    words = pseg.cut(text)
    for w in words:
        if len(w.word) >= 2 and ('x' not in w.flag) and ('r' not in w.flag):
            it = this_Words.objects.filter(word=w.word)
            if len(it) == 0:
                it = this_Words(word=w.word, property=w.flag, count=1)
                it.save()
            else:
                it[0].count += 1
                it[0].save()