from django.urls import re_path

from . import views

urlpatterns = [
    re_path(r'^$', views.index, name='index'),
    re_path(r'^about/', views.about, name='about'),
    re_path(r'^publications/', views.publications, name='publications'),
    re_path(r'^links/', views.links, name='links'),
    re_path(r'^contact/', views.contact, name='contact'),
]