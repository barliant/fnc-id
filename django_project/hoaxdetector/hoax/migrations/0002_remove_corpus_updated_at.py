# Generated by Django 2.0.4 on 2018-04-22 22:56

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hoax', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='corpus',
            name='updated_at',
        ),
    ]
