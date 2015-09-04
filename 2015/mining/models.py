from django.db import models

# Create your models here.
class Info(models.Model):
    user_id = models.IntegerField(max_length=20, null=True, blank=True)
    type = models.IntegerField(null=True, blank=True)
    name = models.CharField(max_length=12, null=True, blank=True)
    stuid = models.CharField(max_length=18, null=True, blank=True)
    college = models.IntegerField(max_length=2, null=True, blank=True)
    sex = models.CharField(max_length=10, null=True, blank=True)
    native_place = models.CharField(max_length=20, null=True, blank=True)
    political = models.CharField(max_length=50, null=True, blank=True)
    major = models.CharField(max_length=20, null=True, blank=True)
    title = models.CharField(max_length=100, null=True, blank=True)
    whoami = models.CharField(max_length=500, null=True, blank=True)
    story = models.CharField(max_length=10000, null=True, blank=True)
    insufficient = models.CharField(max_length=1000, null=True, blank=True)
    img1 = models.CharField(max_length=50, null=True, blank=True)
    intro1 = models.CharField(max_length=500, null=True, blank=True)
    img2 = models.CharField(max_length=50, null=True, blank=True)
    intro2 = models.CharField(max_length=500, null=True, blank=True)
    img3 = models.CharField(max_length=50, null=True, blank=True)
    intro3 = models.CharField(max_length=500, null=True, blank=True)
    tag1 = models.CharField(max_length=20, null=True, blank=True)
    tag2 = models.CharField(max_length=20, null=True, blank=True)
    tag3 = models.CharField(max_length=20, null=True, blank=True)
    repost = models.IntegerField(max_length=10, null=True, blank=True)
    pageview = models.IntegerField(null=True, blank=True)
    like = models.IntegerField(null=True, blank=True)
    recommendations = models.IntegerField(null=True, blank=True)
    votes = models.IntegerField(null=True, blank=True)
    updated_at = models.CharField(max_length=100, null=True, blank=True)
    created_at = models.CharField(max_length=100, null=True, blank=True)
    deleted_at = models.CharField(max_length=100, null=True, blank=True)


class Words_Info(models.Model):
    word = models.CharField(max_length=50)
    count = models.IntegerField()
    property = models.CharField(max_length=50)


class Words_Comment(models.Model):
    word = models.CharField(max_length=50)
    count = models.IntegerField()
    property = models.CharField(max_length=50)


class Words_Merge(models.Model):
    word = models.CharField(max_length=50)
    count = models.IntegerField()
    property = models.CharField(max_length=50)





class Comment(models.Model):
    user_id = models.IntegerField(null=True, blank=True)
    apply_id = models.IntegerField(null=True, blank=True)
    content = models.CharField(max_length=10000, null=True, blank=True)
    creat_at = models.CharField(max_length=50, null=True, blank=True)
    updated_at = models.CharField(max_length=50, null=True, blank=True)
    deleted_at = models.CharField(max_length=50, null=True, blank=True)


class Info2014(models.Model):
    fly_id = models.CharField(max_length=20, null=True, blank=True)
    name = models.CharField(max_length=45, null=True, blank=True)
    yijuhua = models.CharField(max_length=500, null=True, blank=True)
    Njuhua = models.CharField(max_length=4000, null=True, blank=True)
    num_id = models.CharField(max_length=20, null=True, blank=True)
    type = models.CharField(max_length=20, null=True, blank=True)
    img_url = models.CharField(max_length=100, null=True, blank=True)


class Comment2014(models.Model):
    info_id = models.IntegerField(null=True, blank=True)
    name = models.CharField(max_length=45, null=True, blank=True)
    num_id = models.CharField(max_length=45, null=True, blank=True)
    text = models.CharField(max_length=3000, null=True, blank=True)
    now_i = models.IntegerField(null=True, blank=True)


class Words_Info2014(models.Model):
    word = models.CharField(max_length=50)
    count = models.IntegerField()
    property = models.CharField(max_length=50)


class Words_Comment2014(models.Model):
    word = models.CharField(max_length=50)
    count = models.IntegerField()
    property = models.CharField(max_length=50)