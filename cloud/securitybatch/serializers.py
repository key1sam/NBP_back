from django.forms import JSONField
from rest_framework import serializers
from .models import *

class AddsecuritySerializer(serializers.Serializer):

   class Meta:
      model = Securitybatch
      fields = ('username','servertype', 'servername')

class AddsecuritysubSerializer(serializers.Serializer):

   class Meta:
      model = Securitybatchsub
      fields = ('username','servertype', 'servername')