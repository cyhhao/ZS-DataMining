# coding:utf8
"""
Django settings for wusipingyou project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os

BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '6(f+y)_-c74&5jfrr3tyr*u7rqzx$*liek1(vta34#ar6d8b_$'

# SECURITY WARNING: don't run with debug turned on in production!


TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = (
    # 'django.contrib.admin',
    # 'django.contrib.auth',
    # 'django.contrib.contenttypes',
    # 'django.contrib.sessions',
    # 'django.contrib.messages',
    'django.contrib.staticfiles',
    'mining',
)

MIDDLEWARE_CLASSES = (
    # 'django.contrib.sessions.middleware.SessionMiddleware',
    # 'django.middleware.common.CommonMiddleware',
    # 'django.middleware.csrf.CsrfViewMiddl3eware',
    # 'django.contrib.auth.middleware.AuthenticationMiddleware',
    # 'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    # 'django.contrib.messages.middleware.MessageMiddleware',
    # 'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'wusipingyou.urls'

WSGI_APPLICATION = 'wusipingyou.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.7/ref/settings/#databases

try:
    import sae.const

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': sae.const.MYSQL_DB,  # 数据库名
            'USER': sae.const.MYSQL_USER,  # 用户名
            'PASSWORD': sae.const.MYSQL_PASS,  # 密码
            'HOST': sae.const.MYSQL_HOST,  # 主库域名（可读写）
            'PORT': sae.const.MYSQL_PORT,  # 端口，类型为<type 'str'>，请根据框架要求自行转换为int
            #'OPTIONS': {'charset': 'utf8mb4'},
        }
    }
    DEBUG = False
except ImportError:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'wusi_2015',
            'USER': 'root',
            'PASSWORD': 'cyh223',
            'HOST': '127.0.0.1',
            'PORT': '3306',
            #'OPTIONS': {'charset': 'utf8mb4'},
        }
    }
    DEBUG = True

# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/

STATIC_URL = '/static/'

TEMPLATE_DIRS = (
    os.path.join(BASE_DIR, 'templates'),
)