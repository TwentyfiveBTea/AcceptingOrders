# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class HousesLianjia(models.Model):
    title = models.CharField(max_length=255)
    region = models.CharField(max_length=50, blank=True, null=True)
    layout = models.CharField(max_length=20, blank=True, null=True)
    area = models.CharField(max_length=20, blank=True, null=True)
    direction = models.CharField(max_length=20, blank=True, null=True)
    decoration = models.CharField(max_length=20, blank=True, null=True)
    floor = models.CharField(max_length=50, blank=True, null=True)
    total_price = models.CharField(max_length=20, blank=True, null=True)
    unit_price = models.CharField(max_length=20, blank=True, null=True)
    follow_info = models.CharField(max_length=50, blank=True, null=True)
    tags = models.TextField(blank=True, null=True)
    link = models.CharField(unique=True, max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'houses_lianjia'
