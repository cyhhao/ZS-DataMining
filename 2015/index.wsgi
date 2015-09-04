import os
import sys
import sae
root = os.path.dirname(__file__)

sys.path.insert(0, os.path.join(root, 'site-packages'))  



from wusipingyou import wsgi
application = sae.create_wsgi_app(wsgi.application)