from django.conf.urls import patterns, include, url
from mining.main import view
from mining.sae import saeUrl

urlpatterns = patterns('',
                       # Examples:
                       # url(r'^$', 'wusipingyou.views.home', name='home'),
                       # url(r'^blog/', include('blog.urls')),

                       # url(r'^admin/', include(admin.site.urls)),


                       # url(r'^hello$', views.hello),
                       # url(r"^mining-info$", views.mining_info),
                       # url(r"^mining-comment$", views.mining_comment),
                       # url(r"^merge$", views.merge),
                       #
                       # url(r"^search$", views.search),
                       # url(r"^orderby$", views.orderby),
                       # url(r"^weight$", views.weight),
                       # url(r"^search-keywords", views.search_keywords),
                       # url(r"^count-place", views.count_place),


                       url(r"^$", view.main_view),

                       url(r'^sae/', include(saeUrl)),
                       )
