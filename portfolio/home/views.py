from django.shortcuts import render
from django.http import HttpResponse


def index(request):
    return render(request, 'index.html')


def about(request):
    return render(request, 'about.html')


def publications(request):
    return render(request, 'publications.html')


def links(request):
    return render(request, 'links.html')


def contact(request):
    return render(request, 'contact.html')