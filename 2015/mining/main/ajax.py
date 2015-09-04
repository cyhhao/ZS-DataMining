from mining.models import Words_Merge

__author__ = 'cyh'


def getWordsTopA(request):
    List = Words_Merge.objects.filter(property_contants=request.GET['keyword'])
