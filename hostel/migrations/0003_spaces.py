# Generated by Django 3.2.16 on 2022-12-12 10:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hostel', '0002_rename_spaces_space'),
    ]

    operations = [
        migrations.CreateModel(
            name='Spaces',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('room', models.CharField(max_length=100, null=True)),
                ('hostel', models.CharField(max_length=255, null=True)),
                ('room_id', models.CharField(max_length=20, null=True)),
                ('bunk_id', models.CharField(max_length=20, null=True)),
            ],
        ),
    ]
