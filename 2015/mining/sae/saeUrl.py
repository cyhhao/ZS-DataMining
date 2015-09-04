from django.conf.urls import patterns, url
from mining.sae.com import syncdb, makemigrations, migrate, getTime


__author__ = 'cyh'
urlpatterns = patterns('',

                url(r'syncdb$', syncdb),
                url(r'makemigrations$', makemigrations),
                url(r'migrate$', migrate),

                url(r'time$',getTime),



)