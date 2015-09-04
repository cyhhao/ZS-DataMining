# coding:utf-8
import os
import jieba
import sys
import time

__author__ = 'yh'


def cls():
    print("\n" * 10)


print jieba.suggest_freq("中出", False)
seg_list = jieba.cut("this is an apple", cut_all=False, HMM=False)
print("Default Mode: " + "/ ".join(seg_list))  # 精确模式


def view_bar(num=1, sum=100, bar_word=":"):
    rate = float(num) / float(sum)
    rate_num = int(rate * 100)
    print '\r%d%% :' % rate_num,
    for i in range(0, num):
        os.write(1, bar_word)
        sys.stdout.flush()


if __name__ == '__main__':
    for i in range(0, 100):
        time.sleep(0.1)
        # view_bar(i, 100)
        print "\r%d" % i,
        time.sleep(0.1)
        print "\raaaaaaaaaaaa%d"%i,
        # os.write(0, 'aa%d'%i)
        # sys.stdout.flush()


