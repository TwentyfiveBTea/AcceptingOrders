from django.db import models
from django.utils import timezone

class HouseLianjia(models.Model):
    title = models.CharField(max_length=255, verbose_name="标题")
    region = models.CharField(max_length=50, blank=True, null=True, verbose_name="区域")
    layout = models.CharField(max_length=20, blank=True, null=True, verbose_name="户型")
    area = models.CharField(max_length=20, blank=True, null=True, verbose_name="面积")
    direction = models.CharField(max_length=20, blank=True, null=True, verbose_name="朝向")
    decoration = models.CharField(max_length=20, blank=True, null=True, verbose_name="装修情况")
    floor = models.CharField(max_length=50, blank=True, null=True, verbose_name="楼层")
    total_price = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    unit_price = models.DecimalField(max_digits=8, decimal_places=2, null=True, blank=True)
    follow_info = models.CharField(max_length=50, blank=True, null=True, verbose_name="关注信息")
    tags = models.TextField(blank=True, null=True, verbose_name="标签")  # 存储为逗号分隔的字符串
    link = models.CharField(max_length=255, unique=True, verbose_name="详情链接")
    created_at = models.DateTimeField(default=timezone.now, verbose_name="创建时间")

    class Meta:
        app_label = 'house_crawler'
        db_table = 'houses_lianjia'  # 指定数据库表名
        verbose_name = '链家房源'
        verbose_name_plural = '链家房源'
        ordering = ['-created_at']  # 默认按创建时间降序排列

    def __str__(self):
        return f"{self.title} - {self.region} - {self.total_price}"

    def get_tags_list(self):
        """将逗号分隔的标签字符串转换为列表"""
        return self.tags.split(',') if self.tags else []
# Create your models here.
