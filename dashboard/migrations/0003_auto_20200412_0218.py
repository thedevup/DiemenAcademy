# Generated by Django 3.0.5 on 2020-04-12 00:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0002_auto_20200412_0210'),
    ]

    operations = [
        migrations.AlterField(
            model_name='study',
            name='description',
            field=models.TextField(default='saroman'),
        ),
        migrations.AlterField(
            model_name='study',
            name='language',
            field=models.TextField(default='saroman'),
        ),
        migrations.AlterField(
            model_name='study',
            name='name',
            field=models.TextField(default='saroman'),
        ),
        migrations.AlterField(
            model_name='study',
            name='no_of_years',
            field=models.TextField(default='saroman'),
        ),
    ]
